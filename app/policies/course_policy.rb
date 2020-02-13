class CoursePolicy < ApplicationPolicy
    attr_reader :user, :course

    def initialize(user, choice)
        @user = user
        @course = course
    end

    def show?
        user.admin? or user.student?
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