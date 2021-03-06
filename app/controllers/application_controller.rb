class ApplicationController < ActionController::Base
    breadcrumb 'Dash', :root_path
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_page
    impersonates :user

    def set_page
        @courses = Course.all
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :first_name, :last_name)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :first_name, :last_name)}
    end
end
