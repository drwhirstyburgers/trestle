module ProgressLogic

    def get_all_section_percent(user)
        return_arr = []
        user_checkpoints = user.user_checkpoints
        sections = user.sections
        sections.each do |s|
            temp = {}
            temp[:section_id] = s.id
            temp[:percent_complete] = 0
            s.checkpoints.each do |c|
                uc = user_checkpoint.find { |x| x.checkpoint_id == c.id }
                temp[:percent_complete] += uc.complete == true ? c.time_to_complete : 0
            end
            s.quizzes.each do |q|
                uq = UserQuiz.find_by(quiz: q, user: u)
                temp[:percent_complete] += uq.present? ? q.time_to_complete : 0
            end
            return_arr << temp
        end
        return return_arr
    end

    def get_section_percent(section, user)
        sum = 0
        user_checkpoints = user.user_checkpoints
        section.checkpoints.each do |c|
            uc = user_checkpoints.find { |x| x.checkpoint_id == c.id }
            sum += uc.complete == true ? c.time_to_complete : 0
        end
        section.quizzes.each do |q|
            uq = UserQuiz.find_by(user: user, quiz: q)
            sum += uq.present? ? q.time_to_complete : 0
        end
        return sum
    end 


end