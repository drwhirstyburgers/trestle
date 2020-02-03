class DashController < ApplicationController
    require 'progress_logic'
    include ProgressLogic
    require 'course_overview_logic'
    include CourseOverviewLogic

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

    def get_s_and_c
        if params[:user_id].present?
            user = User.find(params[:user_id])
        end
        course = Course.includes(:sections).find(params[:course_id])
        return_arr = []
        course.sections.each do |s|
            section = {}
            section[:section] = s
            unless user.present?
                section[:content] = aggregate_checkpoints_and_quizzes(s.id, current_user)
            else
                section[:content] = aggregate_checkpoints_and_quizzes(s.id, user)
            end
            return_arr << section
        end
        render json: return_arr.to_json, status: :ok
    end

end
