require 'spec_helper'

describe "access/change_roles.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :email => "MyString",
      :encrypted_password => "MyString",
      :salt => "MyString"
    ))
  end

  it "renders the change roles form" do
    render
    assert_select "form", :action => 'change_roles', :method => "post" do
      assert_select "input#user_admin_username", :name => "user[admin_username]"
      assert_select "input#user_admin_password", :name => "user[admin_password]"
      assert_select "input#user_role_ids", :name => "user[role_ids][]"
    end
  end
end
