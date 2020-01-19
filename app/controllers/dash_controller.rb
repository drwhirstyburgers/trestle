class DashController < ApplicationController
    require 'progress_logic'
    include ProgressLogic

    def dash
        if current_user.student?
            @courses = current_user.courses
            @user_courses = current_user.user_courses
        end
    end

    def sign_out
        redirect_to destroy_user_session_path, method: :delete
    end

    def where_you_are
        user = User.find(params[:user_id])
        uc = user.user_courses.find_by(active_course: true)
        render json: return_course_progress(uc.course.id, user)[:wya].to_json, status: :ok
    end

end
