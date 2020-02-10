class ChoicesController < ApplicationController
  require 'quiz_logic'
  include QuizLogic
  before_action :set_choice, only: [:show, :edit, :update, :destroy]

  # GET /choices
  # GET /choices.json
  def index
    if current_user.admin?
      @choices = Choice.all
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /choices/1
  # GET /choices/1.json
  def show
    authorize @choice
  end

  # GET /choices/new
  def new
    if current_user.admin?
      @choice = Choice.new
      @questions = Question.all
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /choices/1/edit
  def edit
    authorize @choice
    if current_user.student? || current_user.guest
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # POST /choices
  # POST /choices.json
  def create
    @choice = Choice.new(choice_params)
    authorize @choice
    respond_to do |format|
      if @choice.save
        format.html { redirect_to @choice, notice: 'Choice was successfully created.' }
        format.json { render :show, status: :created, location: @choice }
      else
        format.html { render :new }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  def submit_choices
    question = Question.find(params[:question_id])
    quiz = question.quiz
    if sort_and_save_question_choices(question, params[:choices])
      redirect_to quiz
    else
      render :new
    end
  end

  # PATCH/PUT /choices/1
  # PATCH/PUT /choices/1.json
  def update
    authorize @choice
    respond_to do |format|
      if @choice.update(choice_params)
        format.html { redirect_to @choice, notice: 'Choice was successfully updated.' }
        format.json { render :show, status: :ok, location: @choice }
      else
        format.html { render :edit }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.json
  def destroy
    authorize @choice
    @choice.destroy
    respond_to do |format|
      format.html { redirect_to choices_url, notice: 'Choice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_choice
    choice = Choice.find(params[:id])
    choice.choice = params[:choice]
    if choice.save!
      render json: "good".to_json, status: :ok
    else
      render json: "no good".to_json, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choice
      @choice = Choice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def choice_params
      params.require(:choice).permit(:question_id, :choice, :number)
    end
end
