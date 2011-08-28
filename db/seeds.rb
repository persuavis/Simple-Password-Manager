# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  username = "admin"
  chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  password = ""
  1.upto(10) { |i| password << chars[rand(chars.size-1)] }
  user = User.create(:username => username, :email => "admin@persuavis.com", :password => password)
  user.roles << Role.new(:rolename => "admin", :description => "admin can do anything")
  user.save!

  $stdout.puts "****************************************************************************************"    
  $stdout.puts "*** NOTICE: your username/password is: #{username}/#{password}"    
  $stdout.puts "****************************************************************************************"
