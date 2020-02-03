class CoursesController < ApplicationController
  require 'new_course_logic'
  include NewCourseLogic
  require 'progress_logic'
  include ProgressLogic
  breadcrumb 'All Courses', :courses_path
  before_action :set_course, only: [:edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if current_user.student? || current_user.guest?
      @courses = Course.where(active: true)
    elsif current_user.admin?
      @courses = Course.all
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.includes(:sections).find(params[:id])
    breadcrumb @course.title, course_path(@course)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if @course.destroy
      flash[:notice] = "Course was successfully destroyed"
      respond_to do |format|
        format.html { redirect_to courses_url }
        format.json { head :no_content }
       end
    end
  end

  def toggle_activate_course
    course = Course.find(params[:id])
    if course.active == false
      course.active = true
    else
      course.active = false
    end
    
    if course.save!
      render json: course.to_json, status: :ok
    end
  end

  def create_user_course
    course = Course.find(params[:course_id])
    if create_new_user_course(params[:course_id], current_user)
      # add flash notices
      redirect_to course
    else
      redirect_to courses_path
    end
  end

  def admin_add_course
    user = User.find(params[:user_id])
    course = Course.find(params[:id])
    unless user.courses.include?(course) || user.admin?
      if create_new_user_course(params[:id], user)
        render json: 'ok'.to_json, status: :ok
      end
    else
      render json: 'bad'.to_json, status: :bad_request
    end
  end

  def activate_user_course
    user_course = UserCourse.find(params[:id])
    user_course.user.deactivate_all_user_courses
    user_course.active_course = true
    return_hash = { course: user_course.course, user_course: user_course }
    if user_course.save!
      redirect_to dash_path
    end
  end

  def get_course_progress
    payload = return_course_progress(params[:id], current_user)
    render json: payload.to_json, status: :ok
  end

  def users_show_course_progress
    user = User.find(params[:user_id])
    render json:  return_course_progress(params[:id], user), status: :ok
  end

  def get_courses
    render json: Course.where(active: true).to_json, status: :ok
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :price, :duration, :accreditation, :active, :preview_id)
    end
end
