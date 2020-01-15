class DashController < ApplicationController
    def dash
        if current_user.student?
            @courses = current_user.courses
            @user_courses = current_user.user_courses
        end
    end

    def sign_out
        redirect_to destroy_user_session_path, method: :delete
    end
end
