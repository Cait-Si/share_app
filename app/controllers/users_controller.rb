class UsersController < ApplicationController
  def account
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name,:icon,:introduction))
      redirect_to users_account_path
    else
      render users_profile_path
    end
  end
end
