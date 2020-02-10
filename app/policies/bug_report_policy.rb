class BugReportPolicy < ApplicationPolicy
    attr_reader :user, :bug_report

    def initialize(user, post)
        @user = user
        @bug_report = bug_report
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