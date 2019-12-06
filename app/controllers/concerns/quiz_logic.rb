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

end