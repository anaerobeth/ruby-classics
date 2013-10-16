class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
  end

  def index
    @user_profiles = UserProfile.order("id").page(params[:page]).per(5)
  end

  def create
    @profile = UserProfile.new(user_profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      flash[:notice] = 'Wow, your profile page looks great.'
      redirect_to user_profiles_path(@profile)
    else
      render :new
    end
  end

  def show
    @user_profile = UserProfile.find(user_profile_params)
  end


  protected
  def user_profile_params
    params.require(:user_profile).permit(:hometown, :twitter,
      :github, :blog, :website, :for_hire, :for_pairing)
  end

end
