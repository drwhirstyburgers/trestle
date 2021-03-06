class SectionsController < ApplicationController
  require 'progress_logic'
  include ProgressLogic

  breadcrumb 'Courses', :courses_path
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    if current_user.admin?
      @q = Section.ransack(params[:q])
      @sections = @q.result.includes(:course).paginate(page: params[:page])
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    if current_user.guest? || current_user.student?
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /sections/new
  def new
    if current_user.admin?
      breadcrumb "New Section", new_section_path
      @section = Section.new
      @courses = Course.all
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /sections/1/edit
  def edit
    if current_user.admin?
      breadcrumb @section.course.title, course_path(@section.course)
      breadcrumb @section.name + " / Edit", edit_section_path(@section)
      @courses = Course.all
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @course = Course.find(section_params[:course_id])

    respond_to do |format|
      if @section.save
        format.html { redirect_to @course, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    @course = Course.find(section_params[:course_id])
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @course, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_section_progress
    section = Section.find(params[:section_id])
    render json: get_section_percent(section, current_user).to_json, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:course_id, :name, :description, :time_to_complete, :order_number)
    end
end
