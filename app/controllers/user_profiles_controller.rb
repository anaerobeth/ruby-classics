class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
  end

  def index
    @q = UserProfile.search(params[:q])
    @user_profiles = @q.result.order("id").page(params[:page]).per(5)
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id

    if @user_profile.save
      flash[:notice] = 'Wow, your profile page looks great.'
      redirect_to user_profiles_path(@user_profile)
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
