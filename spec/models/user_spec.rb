require 'spec_helper'

module UserSpecHelper
  def valid_user_attributes
    {
      :username => "goodname",
      :email => "goodname@email.com",
      :encrypted_password => "dc8c4afee22ef525bf3269d27ff25888052da76b2c8dcaab7e7e6af3efc13f59",
      :salt => '21696922800.8241008911277153'
    }
  end
end
describe User, "with good attributes" do
  include UserSpecHelper
  #pending "add some examples to (or delete) #{__FILE__}"
  
  before(:each) do
    @user = User.new
    @user.attributes = valid_user_attributes
  end
  
  it do
    @user.should be_valid
  end
  
  it "should have no errors" do
    @user.should have(0).error_on(:username)
    @user.should have(0).error_on(:email)
    @user.should have(0).error_on(:encrypted_password)
    @user.should have(0).error_on(:salt)
  end
end

describe User, "with empty attributes" do
  include UserSpecHelper
  
  before(:each) do
    @user = User.new
  end
  
  it do
    @user.should_not be_valid
  end
  
  it "should have errors" do
    @user.should have(2).error_on(:username)
    @user.should have(0).error_on(:email)
    @user.should have(1).error_on(:encrypted_password)
    @user.should have(1).error_on(:salt)
  end
end

describe User, "with a short username" do
  include UserSpecHelper
  
  before(:each) do
    @user = User.new
    @user.attributes = valid_user_attributes.with(:username => "s")
  end

  it do
    @user.should_not be_valid
  end
  
  it "should have an error on username" do
    @user.should have(1).error_on(:username)
  end
end

describe User, "with a blank username" do
  include UserSpecHelper
  
  before(:each) do
    @user = User.new
    @user.attributes = valid_user_attributes.except(:username)
  end

  it do
    @user.should_not be_valid
  end
  
  it "should have two errors on username" do
    @user.should have(2).error_on(:username)
  end
end

describe User, "with a blank password" do
  include UserSpecHelper
  
  before(:each) do
    @user = User.new
    @user.attributes = valid_user_attributes.except(:encrypted_password)
  end

  it do
    @user.should_not be_valid
  end
  
  it "should have one error on encrypted_password" do
    @user.should have(1).error_on(:encrypted_password)
  end
end


