module NewCourseLogic
    def create_new_user_course(id, user)
        course = Course.includes(sections: [:checkpoints]).find(id)
        user.courses << course
        course.sections.each do |s|
            user.sections << s
            s.checkpoints.each do |c|
                user.checkpoints << c
            end
        end
        user.role = 1
        user.save!
    end
end