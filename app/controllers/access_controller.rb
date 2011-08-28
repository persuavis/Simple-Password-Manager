class AccessController < ApplicationController
  
  def users
    @users = User.includes(:roles).all
    @roles = Role.all
  end

  def change_password
  end

end
