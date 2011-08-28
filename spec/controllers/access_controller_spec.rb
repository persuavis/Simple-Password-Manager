require 'spec_helper'
require 'models/user_spec'

describe AccessController do
  include UserSpecHelper

  def valid_attributes
    valid_user_attributes
  end

  describe "GET 'users'" do
    it "should be successful" do
      get 'users'
      response.should be_success
    end
  end

  describe "GET 'change_password'" do
    it "should be successful" do
      user = User.create! valid_attributes
      get 'change_password', :id => user.id
      response.should be_success
    end
  end

end
