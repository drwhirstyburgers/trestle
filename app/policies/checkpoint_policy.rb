class CheckpointPolicy < ApplicationPolicy
    attr_reader :user, :checkpoint

    def initialize(user, checkpoint)
        @user = user
        @checkpoint = checkpoint
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