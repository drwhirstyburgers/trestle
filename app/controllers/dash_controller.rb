class DashController < ApplicationController
    def dash
    end

    def sign_out
        redirect_to destroy_user_session_path, method: :delete
    end
end
