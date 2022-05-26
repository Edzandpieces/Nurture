class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = policy_scope(User).sort_by(&:first_name)
  end

  def show
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
