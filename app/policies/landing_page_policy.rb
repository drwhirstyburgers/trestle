class LandingPagePolicy < ApplicationPolicy
    attr_reader :user, :landing_page

    def initialize(user, choice)
        @user = user
        @landing_page = landing_page
    end

    def show?
        user.admin?
    end

    def edit?
        user.admin?
    end

    def create?
        user.admin?
    end

    def update?
        user.admin?
    end

    def destroy?
        user.admin?
    end
end