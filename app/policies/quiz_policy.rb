class QuizPolicy < ApplicationPolicy
    attr_reader :user, :quiz

    def initialize(user, quiz)
        @user = user
        @quiz = quiz
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