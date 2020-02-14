class PreviewsController < ApplicationController
  require 'stripe'
  require 'new_course_logic'
  include NewCourseLogic
  before_action :set_preview, only: [:show, :edit, :update, :destroy]

  # GET /previews
  # GET /previews.json
  def index
    if current_user.admin?
      @previews = Preview.all
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /previews/1
  # GET /previews/1.json
  def show
    @course = @preview.course
    @sections = @course.sections
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "#{@course.title}",
      amount: @course.price * 100
    }
  end

  # GET /previews/new
  def new
    if current_user.admin?
      @preview = Preview.new
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /previews/1/edit
  def edit
    if current_user.guest? || current_user.student?
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # POST /previews
  # POST /previews.json
  def create
    @preview = Preview.new(preview_params)

    respond_to do |format|
      if @preview.save
        format.html { redirect_to @preview, notice: 'Preview was successfully created.' }
        format.json { render :show, status: :created, location: @preview }
      else
        format.html { render :new }
        format.json { render json: @preview.errors, status: :unprocessable_entity }
      end
    end
  end

  def course_preview
    course = Course.includes(:preview).find(params[:id])
    if course.preview.present?
      render json: course.preview.to_json, status: :ok
    else
      render json: nil.to_json, status: :ok
    end
  end

  # PATCH/PUT /previews/1
  # PATCH/PUT /previews/1.json
  def update
    respond_to do |format|
      if @preview.update(preview_params)
        format.html { redirect_to @preview, notice: 'Preview was successfully updated.' }
        format.json { render :show, status: :ok, location: @preview }
      else
        format.html { render :edit }
        format.json { render json: @preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /previews/1
  # DELETE /previews/1.json
  def destroy
    @preview.destroy
    respond_to do |format|
      format.html { redirect_to previews_url, notice: 'Preview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_charge
    @preview = Preview.find(params[:preview_id])
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
  
    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: configure_price(@preview.course),
      description: "#{@preview.course.title} enrollment - #{current_user.email}",
      currency: 'usd'
    )

    create_new_user_course(@preview.course.id, current_user)
    flash[:notice] = "Thanks for enrolling! #{current_user.email}!"
    redirect_to @preview.course # or wherever
  
    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preview
      @preview = Preview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preview_params
      params.require(:preview).permit(:course_id, :blurb, :pitch, :image)
    end

    def configure_price(course)
      indx = course.price.to_s.split('').index('.') + 1
      length = course.price.to_s.split('').count
      if length - indx == 1
        return course.price.to_s.gsub('.', '').to_i * 10
      elsif length - indx == 2
        return course.price.to_s.gsub('.', '').to_i
      end
    end
end
