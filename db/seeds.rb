# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  role = Role.create(:rolename => "admin", :description => "an admin can do anything")
  role = Role.create(:rolename => "editor", :description => "an editor can write stuff")
  role = Role.create(:rolename => "publisher", :description => "a publisher can publish stuff")
  
  username = "root" # user 'root' cannot be modified later
  chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  password = ""
  1.upto(10) { |i| password << chars[rand(chars.size-1)] }
  user = User.new(:username => username, :email => "support@persuavis.com", :password => password)
  user.roles << Role.find_by_rolename("admin")
  user.save!(:validate => false)

  $stdout.puts "****************************************************************************************"    
  $stdout.puts "*** NOTICE: your username/password is: #{username}/#{password}"    
  $stdout.puts "****************************************************************************************"
