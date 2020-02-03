module ProgressLogic

    def return_course_progress(id, user)
        course = Course.includes(:sections).find(id)
        return_hash = {}
        return_hash[:wysb] = calculate_where_you_should_be(user, course)
        sections_progress = []
        course.sections.each do |s|
            temp = {}
            temp[:section_id] = s.id
            temp[:percent_complete] = get_section_percent(s, user)
            sections_progress << temp
        end
        return_hash[:wya] = calculate_where_you_are(sections_progress, course.sections).round
        return return_hash
    end

    def get_all_section_percent(user)
        return_arr = []
        user_checkpoints = user.user_checkpoints
        sections = user.sections
        sections.each do |s|
            temp = {}
            temp[:section_id] = s.id
            temp[:percent_complete] = 0
            s.checkpoints.each do |c|
                uc = user_checkpoints.find { |x| x.checkpoint_id == c.id }
                temp[:percent_complete] += uc.complete == true ? c.time_to_complete : 0
            end
            s.quizzes.each do |q|
                uq = UserQuiz.find_by(quiz: q, user: user)
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
            if uc.present?
                sum += uc.complete == true ? c.time_to_complete : 0
            end
        end
        section.quizzes.each do |q|
            uq = UserQuiz.find_by(user: user, quiz: q)
            sum += uq.present? ? q.time_to_complete : 0
        end
        return sum
    end

    def calculate_where_you_should_be(user, course)
        start_date = user.user_courses.find_by(course_id: course.id).created_at
        end_date = start_date.to_date + course.duration.months
        total_days = (end_date.to_date - start_date.to_date).to_i
        days_since_start = (Date.today - start_date.to_date).to_i
        if (days_since_start.to_f / total_days.to_f) * 100 > 100
            percent = 100
        elsif  (days_since_start.to_f / total_days.to_f) * 100 < 0
            percent = 0
        else
            percent = ((days_since_start.to_f / total_days.to_f) * 100).round
        end
        return percent
    end
    
    def calculate_where_you_are(sections_progress, sections)
        total = 0.00
        sections_progress.each do |s|
            section = sections.find { |x| s[:section_id] == x.id }
            unless s[:percent_complete] >= 100
                total += (s[:percent_complete].to_s.split('').delete_if { |x| x == '.' }.insert(0, ".").join('').to_f * section.time_to_complete.to_f)
            else
                total += section.time_to_complete
            end
        end
        return total
    end

end