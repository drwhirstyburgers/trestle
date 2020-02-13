class QuestionPolicy < ApplicationPolicy
    attr_reader :user, :question

    def initialize(user, question)
        @user = user
        @question = question
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