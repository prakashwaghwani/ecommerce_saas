class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    @user = user_params
    @profile = Profile.new
  end

  def create
    @user = user_params
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(@user.id)
    else
      render action: :new
    end
  end

  def edit
    @user = user_params
    @profile = @user.profile

  end

  def update
    @user = user_params
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end


  def show
  end

  def destroy
  end

  private

  def user_params
    @user = User.find(params[:user_id])
  end

  def only_current_user
    @user = User.find(params[:user_id])
    redirect_to root_url unless @user == current_user
  end


  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_email, :job_title, :phone_number, :description, :avatar, :user_id)
  end
end
