class ChoicesPolicy < ApplicationPolicy
    attr_reader :user, :choice

    def initialize(user, choice)
        @user = user
        @checkpoint = choice
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