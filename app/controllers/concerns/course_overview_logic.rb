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
                    temp[:complete] = true
                else
                    temp[:complete] = false
                end
            end
            temp[:type] = "checkpoint"
            temp[:id] = c.id
            temp[:title] = c.title
            temp[:order_number] = c.order_number
            temp[:description] = c.description
            return_arr << temp
        end
        quizzes.each do |q|
            temp = {}
            temp[:type] = "quiz"
            temp[:id] = q.id
            temp[:title] = q.title
            temp[:order_number] = q.order_number
            temp[:description] = q.description
            return_arr << temp
        end
        return return_arr
    end
    
end