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
    end
  end
  
  def change_roles
    @user = User.find(params[:id])
    @roles = Role.all
    if request.put?
      params[:user][:role_ids] ||= []
      @admin = User.find_by_username(params[:user][:admin_username])
      if !@admin.nil? && @admin.authenticate?(params[:user][:admin_password])
        @user.role_ids = params[:user][:role_ids]
        if @user.save
          redirect_to url_for(access_users_path), :notice => "roles have been changed"
        else
          flash[:alert] = "new roles cannot be saved"
          render
        end
      else
        flash[:alert] = "You are not authorized to make these changes"
        render
      end
    end
  end

end
