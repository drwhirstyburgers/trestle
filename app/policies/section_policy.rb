class SectionPolicy < ApplicationPolicy
    attr_reader :user, :section

    def initialize(user, section)
        @user = user
        @question = section
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