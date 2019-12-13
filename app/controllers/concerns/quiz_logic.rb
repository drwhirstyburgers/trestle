module QuizLogic
    
    def sort_and_save_question_choices(question, choices)
        choices = eval(choices)
        choices.each do |c|
            choice = Choice.new(question_id: question.id, choice: c[:option], number: c[:order_number])
            if c[:correct_choice] == true
                question.correct_choice = c[:order_number]
                question.save!
            end
            choice.save!
        end
    end

    def serve_complete_quiz_sorted(quiz)
        questions = []
        comp_quiz = {}
        comp_quiz[:quiz] = quiz
        quiz.questions.each do |q|
            choices = []
            temp = {}
            temp[:number] = q.order_number
            temp[:question] = q.question
            temp[:correct_choice] = q.correct_choice
            temp[:video] = q.video_url
            temp[:image] = url_for(q.image) if q.image.present?
            temp[:id] = q.id
            q.choices.each do |c|
                choice = {}
                choice[:choice_number] = c.number
                choice[:choice] = c.choice
                choice[:id] = c.id
                choices << choice
            end
            temp[:choices] = choices
            questions << temp
        end
        comp_quiz[:questions] = questions
        return comp_quiz
    end

    def score_quiz(quiz, selections, user)
        quiz = quiz
        user_questions = []
        user_quiz = UserQuiz.new(quiz: quiz, user: user)
        question_ids = selections.map { |s| s[:question_id] }
        questions = Question.find(question_ids)
        selections.each do |s|
            question = questions.find { |q| q.id == s[:question_id] }
            user_question = UserQuestion.new(question: question, user: user, quiz_id: quiz.id, choice: s[:selection], correct_choice: question.correct_choice)
            user_questions << user_question
            user_question.save!
        end
        user_quiz.score = get_total_score(user_questions, user_quiz, quiz)
        user_quiz.save!
        return_hash = {
            user_quiz: user_quiz,
            user_questions: user_questions
        }
        return return_hash
    end

    def get_total_score(user_questions, user_quiz, quiz)
        score = 0
        total_questions = quiz.questions.count
        user_questions.each do |uq|
            if uq.choice == uq.correct_choice
                score += 1
            end
        end
        score = (score.to_f / total_questions.to_f) * 100
        return score.round.to_i
    end

end