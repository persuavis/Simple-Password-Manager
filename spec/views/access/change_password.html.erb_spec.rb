require 'spec_helper'

describe "access/change_password.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :email => "MyString",
      :encrypted_password => "MyString",
      :salt => "MyString"
    ))
  end

  it "renders the change password form" do
    render
    assert_select "form", :action => 'change_password', :method => "post" do
      assert_select "input#user_old_password", :name => "user[old_password]"
      assert_select "input#user_password", :name => "user[password]"
    end
  end
end
