class ProfilesController < ApplicationController
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
    @profile = profile_id

  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def user_params
    @user = User.find(params[:user_id])
  end

  def profile_id
    Profile.find(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_email, :job_title, :phone_number, :description, :user_id)
  end
end
