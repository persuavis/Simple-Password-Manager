require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AccessHelper. For example:
#
# describe AccessHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe AccessHelper do
  describe "put checkmarks" do
    it "returns the appropriate checkmark" do
      helper.checkmark(true, "true", "false").should == "true"
      helper.checkmark(false, "true", "false").should == "false"
    end
  end
end
