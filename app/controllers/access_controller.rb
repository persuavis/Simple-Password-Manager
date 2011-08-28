class AccessController < ApplicationController
  
  def users
    @users = User.includes(:roles).all
    @roles = Role.all
  end

  def change_password
    @user = User.find(params[:id])
    if request.put?
      if @user.authenticate?(params[:user][:old_password])
        @user.password = params[:user][:password]
        if @user.save
          redirect_to url_for(access_users_path), :notice => "password has been changed"
        else
          flash[:alert] = "new password cannot be saved"
          render
        end
      else
        @user.errors.add(:old_password, "old password doesn't match")
        flash[:alert] = "old password doesn't match"
        render
      end
    else
    end
  end

end
