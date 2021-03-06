class CheckpointsController < ApplicationController
  require 'course_overview_logic'
  include CourseOverviewLogic
  breadcrumb 'Courses', :courses_path
  before_action :set_checkpoint, only: [:edit, :update, :destroy]

  # GET /checkpoints
  # GET /checkpoints.json
  def index
    if current_user.admin?
      @q = Checkpoint.ransack(params[:q])
      @checkpoints = @q.result.includes(:section).paginate(page: params[:page])
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /checkpoints/1
  # GET /checkpoints/1.json
  def show
    @checkpoint = Checkpoint.includes(section: :course).find(params[:id])
    @course = @checkpoint.section.course
    breadcrumb @course.title, course_path(@course)
    breadcrumb @checkpoint.section.name, course_path(@course)
    breadcrumb @checkpoint.title, checkpoint_path(@checkpoint)
  end

  def next_checkpoint
    if params[:checkpoint].present?
      checkpoint = Checkpoint.find(params[:checkpoint])
    else
      checkpoint = Quiz.find(params[:quiz])
    end
    checkpoints = aggregate_checkpoints_and_quizzes(checkpoint.section.id, current_user)
    course = checkpoint.section.course
    next_number = checkpoint.order_number + 1
    succeeding = checkpoints.select { |c| c[:order_number] == next_number }.first
    puts succeeding
    if succeeding.blank?
      redirect_to course
    elsif succeeding[:type] == 'quiz'
      quiz = Quiz.find(succeeding[:id])
      redirect_to quiz
    else
      next_checkpoint = Checkpoint.find(succeeding[:id])
      redirect_to checkpoint_path(next_checkpoint)
    end
  end


  # GET /checkpoints/new
  def new
    if current_user.admin?
      breadcrumb "New Checkpoint", new_checkpoint_path
      @checkpoint = Checkpoint.new
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /checkpoints/1/edit
  def edit
    if current_user.admin?
      breadcrumb @checkpoint.title + " / Edit", edit_checkpoint_path(@checkpoint)
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # POST /checkpoints
  # POST /checkpoints.json
  def create
    @checkpoint = Checkpoint.new(checkpoint_params)

    respond_to do |format|
      if @checkpoint.save
        format.html { redirect_to @checkpoint, notice: 'Checkpoint was successfully created.' }
        format.json { render :show, status: :created, location: @checkpoint }
      else
        format.html { render :new }
        format.json { render json: @checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkpoints/1
  # PATCH/PUT /checkpoints/1.json
  def update
    respond_to do |format|
      if @checkpoint.update(checkpoint_params)
        format.html { redirect_to @checkpoint, notice: 'Checkpoint was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkpoint }
      else
        format.html { render :edit }
        format.json { render json: @checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkpoints/1
  # DELETE /checkpoints/1.json
  def destroy
    @checkpoint.destroy
    respond_to do |format|
      format.html { redirect_to checkpoints_url, notice: 'Checkpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_section_checkpoints
    checkpoints = aggregate_checkpoints_and_quizzes(params[:section_id], current_user)
    render json: checkpoints.sort_by { |c| c[:order_number] }.to_json, status: :ok
  end

  def mark_checkpoint_complete
    user_checkpoint = UserCheckpoint.find_by(user_id: params[:user_id], checkpoint_id: params[:checkpoint_id])
    if user_checkpoint.blank?
      user_checkpoint = UserCheckpoint.new(user_id: params[:user_id], checkpoint_id: params[:checkpoint_id])
    end
    user_checkpoint.complete = true
    if user_checkpoint.save!
      render json: "okay".to_json, status: :ok
    end
  end

  def sort
    checks = JSON.parse(params[:checkpoints])
    sample_check = Checkpoint.find(checks[0]['id'])
    section = sample_check.section
    assign_order(checks)
    render json: aggregate_checkpoints_and_quizzes(section.id, current_user).sort_by { |x| x[:order_number] }.to_json, status: :ok
  end

  def check_if_complete
    user_checkpoint = UserCheckpoint.find_by(user_id: params[:user_id], checkpoint_id: params[:checkpoint_id])
    if user_checkpoint.complete == true
      render json: true.to_json, status: :ok
    else
      render json: false.to_json, status: :ok
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint
      @checkpoint = Checkpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkpoint_params
      params.require(:checkpoint).permit(:section_id, :title, :description, :order_number, :time_to_complete, :content)
    end
end
