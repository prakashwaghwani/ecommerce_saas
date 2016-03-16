class UsersController < ApplicationController
  def show
    @user = user_params
  end

  private

  def user_params
    User.find(params[:id])
  end
end
