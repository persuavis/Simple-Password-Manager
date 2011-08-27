require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "Username",
      :email => "Email",
      :encrypted_password => "Encrypted Password",
      :salt => "Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Encrypted Password/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Salt/)
  end
end
