class DashController < ApplicationController
    require 'progress_logic'
    include ProgressLogic
    require 'course_overview_logic'
    include CourseOverviewLogic

    def dash
        if current_user.student?
            @courses = current_user.courses
            @user_courses = current_user.user_courses
        elsif current_user.admin?
            @graph_data = get_graph_data
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

    def get_new_students
        today = Date.today.beginning_of_month
        render json: User.where(role: 'student').where('created_at >= ?', today).count.to_json, status: :ok
    end

    def get_new_guests
        today = Date.today.beginning_of_month
        render json: User.where(role: 'guest').where('created_at >= ?', today).count.to_json, status: :ok
    end

    def monthly_revenue
        today = Date.today.beginning_of_month
        new_users = User.includes(:courses).where(role: 'student').where('created_at >= ?', today)
        render json: new_users.map { |u| u.courses.map { |c| c.price } }.flatten(1).sum.to_json, status: :ok
    end

    def get_graph_data
        return_hash = {}
        return_hash[:students] = []
        return_hash[:guests] = []
        return_hash[:months] = []
        end_date = Date.today.end_of_month
        start_date = Date.today - 6.months
        (start_date..end_date).select { |d| d.day == 1 }.each do |d|
            end_of_month = d.end_of_month
            return_hash[:students] << User.where(role: 'student').where('created_at >= ?', d).where('created_at <= ?', end_of_month).count
            return_hash[:guests] << User.where(role: 'guest').where('created_at >= ?', d).where('created_at <= ?', end_of_month).count
            return_hash[:months] << d.strftime("%B")
        end
        return return_hash
    end

end
