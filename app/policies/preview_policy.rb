class PreviewPolicy < ApplicationPolicy
    attr_reader :user, :preview

    def initialize(user, choice)
        @user = user
        @preview = preview
    end

    def show?
        user.admin? or user.guest? or user.student?
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