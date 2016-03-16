class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = user_params
  end

  private

  def user_params
    User.find(params[:id])
  end
end
