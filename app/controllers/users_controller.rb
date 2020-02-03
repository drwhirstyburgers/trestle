class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.admin?
            @q = User.ransack(params[:q])
            @users = @q.result.includes(:courses).paginate(page: params[:page])
        else
            redirect_to dash_path
        end
    end

    def show
        if current_user.admin?
            @user = User.find(params[:id])
        else
            redirect_to dash_path
        end
    end

    def make_admin
        if current_user.admin?
            user = User.find(params[:id])
            user.make_admin
            render json: user.role.to_json, status: :ok
        else
            redirect_to dash_path
        end
    end
end
