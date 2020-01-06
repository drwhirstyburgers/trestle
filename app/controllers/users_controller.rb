class UsersController < ApplicationController
    def index
        @q = User.ransack(params[:q])
        @users = @q.result.includes(:courses).paginate(page: params[:page])
    end
end
