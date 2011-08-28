class Role < ActiveRecord::Base
  
  validates_presence_of :rolename, :description
  
end
