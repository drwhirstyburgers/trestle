module CourseOverviewLogic

    def aggregate_checkpoints_and_quizzes(section_id, user)
        return_arr = []
        section = Section.includes(:checkpoints, :quizzes).find(section_id)
        checkpoints = section.checkpoints
        quizzes = section.quizzes
        checkpoints.each do |c|
            user_checkpoint = user.user_checkpoints.find { |uc| uc.checkpoint_id == c.id }
            temp = {}
            if user_checkpoint.present?
                if user_checkpoint.complete == true
                    temp[:completed] = true
                else
                    temp[:completed] = false
                end
            else
                temp[:completed] = false
            end
            temp[:type] = "checkpoint"
            temp[:id] = c.id
            temp[:title] = c.title
            temp[:order_number] = c.order_number
            temp[:description] = c.description
            temp[:time_to_complete] = c.time_to_complete
            return_arr << temp
        end
        quizzes.each do |q|
            temp = {}
            uq = UserQuiz.where(user_id: user.id, quiz: q.id).last
            if uq.present?
                temp[:completed] = true
                temp[:score] = uq.score
            else
                temp[:completed] = false
                temp[:score] = nil
            end
            temp[:type] = "quiz"
            temp[:id] = q.id
            temp[:title] = q.title
            temp[:order_number] = q.order_number
            temp[:description] = q.description
            temp[:time_to_complete] = q.time_to_complete
            return_arr << temp
        end
        return return_arr
    end

    def assign_order(checks)
        checks.each_with_index do |c,i|
            puts c['type']
            if c['type'] == 'checkpoint'
                check = Checkpoint.find(c['id'])
                check.order_number = i + 1
                check.save!
            else
                quiz = Quiz.find(c['id'])
                quiz.order_number = i + 1
                quiz.save!
            end
        end
    end

 
end