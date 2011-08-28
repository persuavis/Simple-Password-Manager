require 'spec_helper'

describe AccessController do

  describe "GET 'users'" do
    it "should be successful" do
      get 'users'
      response.should be_success
    end
  end

  describe "GET 'change_password'" do
    it "should be successful" do
      get 'change_password'
      response.should be_success
    end
  end

end
