class QuizzesController < ApplicationController
  require 'quiz_logic'
  include QuizLogic
  require 'course_overview_logic'
  include CourseOverviewLogic
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    if current_user.admin?
      @q = Quiz.ransack(params[:q])
      @quizzes = @q.result.includes(:questions, :section).paginate(page: params[:page])
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    authorize @quiz
    @complete_quiz = serve_complete_quiz_sorted(@quiz)
    @section = @quiz.section
    @course = @quiz.section.course
    @next_checkpoint = get_next_checkpoint(@quiz)
    puts @next_checkpoint.to_json
  end

  # GET /quizzes/new
  def new
    authorize @quiz
    if current_user.admin?
      @quiz = Quiz.new
    else
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # GET /quizzes/1/edit
  def edit
    authorize @quiz
    if current_user.guest? || current_user.student?
      redirect_to root_path
      flash[:notice] = "Whoops! You're not supposed to be there!"
    end
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    authorize @quiz
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to new_question_path, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    authorize @quiz
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    authorize @quiz
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit_quiz
    puts params[:answers]
    quiz = Quiz.find(params[:quiz])
    selections = eval(params[:answers])
    results = score_quiz(quiz, selections, current_user)
    render json: results.to_json, status: :ok
  end

  def check_quiz
    user = User.find(params[:user_id])
    user_quiz = UserQuiz.where(user_id: user.id, quiz_id: params[:quiz_id]).last
    quiz = Quiz.includes(:questions).find(params[:quiz_id])
    questions = quiz.questions
    temp = UserQuestion.where(question: questions, user: user)
    user_questions =  temp.map { |x| x if x.created_at == temp.select { |y| y.question ==  x.question }.map(&:created_at).max }.compact
    return_hash = format_user_quiz(user_questions, user_quiz)
    render json: return_hash.to_json, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:section_id, :title, :order_number, :time_to_complete, :description)
    end

    def get_next_checkpoint(quiz)
      checkpoints = aggregate_checkpoints_and_quizzes(quiz.section.id, current_user)
      next_number = quiz.order_number + 1
      next_checkpoint = checkpoints.find { |c| c[:order_number] == next_number }
      if next_checkpoint.present?
        if next_checkpoint[:type] == 'quiz'
          next_checkpoint = {is_a: 'qu', id: next_checkpoint[:id] }
        else
          next_checkpoint = {is_a: 'ch', id: next_checkpoint[:id] }
        end
      else
        next_checkpoint = 'last'
      end
      return next_checkpoint
    end
end
