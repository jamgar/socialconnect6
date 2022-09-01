class ProfilesController < ApplicationController
  before_action :set_profile

  def show
    user = User.find(@profile.user_id)
    @posts = user.posts.all.order(created_at: :desc)
  end

  def edit
    unless current_user == @profile.user
      redirect_to profile_path(@profile)
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated successfully"
    else
      render :edit
    end
  end
  
private
  def set_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(:display_name, :bio, :profile_image, :user_id)
  end
end