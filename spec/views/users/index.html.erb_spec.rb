require 'spec_helper'

describe "users/index.html.erb" do
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
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "n".to_s, :count => 0
    assert_select "tr>td", :text => "y".to_s, :count => 0
  end
end
