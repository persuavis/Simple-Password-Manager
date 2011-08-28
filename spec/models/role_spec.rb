require 'spec_helper'

module RoleSpecHelper
  def valid_role_attributes
    {
      :rolename => "admin",
      :description => 'someone who can change anyting'
    }
  end
end

describe Role do
  describe Role, "with good attributes" do
    include RoleSpecHelper

    before(:each) do
      @role = Role.new
      @role.attributes = valid_role_attributes
    end

    it do
      @role.should be_valid
    end

    it "should have no errors" do
      @role.should have(0).error_on(:rolename)
      @role.should have(0).error_on(:description)
    end
  end
end

describe Role, "with empty attributes" do
  include RoleSpecHelper
  
  before(:each) do
    @role = Role.new
  end
  
  it do
    @role.should_not be_valid
  end
  
  it "should have errors" do
    @role.should have(1).error_on(:rolename)
    @role.should have(1).error_on(:description)
  end
end

