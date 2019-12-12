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

end