require 'spec_helper'

describe "access/users.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :username => "Username",
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :salt => "Salt"
      ),
      stub_model(User,
        :username => "Username",
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :salt => "Salt"
      )
    ])
    assign(:roles, [
      stub_model(Role,
        :rolename => "admin",
        :description => "admin"
      ),
      stub_model(Role,
        :rolename => "read",
        :description => "read"
      )
      ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>th", :text => "Username".to_s, :count => 1
    assert_select "tr>th", :text => "Email".to_s, :count => 1
    assert_select "tr>th", :text => "admin".to_s, :count => 1
    assert_select "tr>th", :text => "read".to_s, :count => 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 0
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Salt".to_s, :count => 0
  end
end
