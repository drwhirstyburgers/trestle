class LandingPagesController < ApplicationController
  before_action :set_landing_page, only: [:show, :edit, :update, :destroy]

  # GET /landing_pages
  # GET /landing_pages.json
  def index
    @course = Course.first
    if user_signed_in? && current_user.student? && @course.present?
      redirect_to dash_path
    elsif user_signed_in? && current_user.admin?
      redirect_to dash_path
    elsif user_signed_in? && current_user.guest?
      redirect_to courses_path
    end
  end

  # GET /landing_pages/1
  # GET /landing_pages/1.json
  def show
    authorize @landing_page
  end

  # GET /landing_pages/new
  def new
    if current_user.admin?
      @landing_page = LandingPage.new
      authorize @landing_page
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /landing_pages/1/edit
  def edit
    authorize @landing_page
    if current_user.guest? || current_user.student?
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # POST /landing_pages
  # POST /landing_pages.json
  def create
    @landing_page = LandingPage.new(landing_page_params)
    authorize @landing_page

    respond_to do |format|
      if @landing_page.save
        format.html { redirect_to @landing_page, notice: 'Landing page was successfully created.' }
        format.json { render :show, status: :created, location: @landing_page }
      else
        format.html { render :new }
        format.json { render json: @landing_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landing_pages/1
  # PATCH/PUT /landing_pages/1.json
  def update
    authorize @landing_page
    respond_to do |format|
      if @landing_page.update(landing_page_params)
        format.html { redirect_to @landing_page, notice: 'Landing page was successfully updated.' }
        format.json { render :show, status: :ok, location: @landing_page }
      else
        format.html { render :edit }
        format.json { render json: @landing_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_pages/1
  # DELETE /landing_pages/1.json
  def destroy
    authorize @landing_page
    @landing_page.destroy
    respond_to do |format|
      format.html { redirect_to landing_pages_url, notice: 'Landing page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing_page
      @landing_page = LandingPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landing_page_params
      params.fetch(:landing_page, {})
    end
end
