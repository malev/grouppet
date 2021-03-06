# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Language.find_or_create_by_name("Ruby")
Language.find_or_create_by_name("Html")
Language.find_or_create_by_name("Css")
Language.find_or_create_by_name("Javascript")
Language.find_or_create_by_name("Python")
Language.find_or_create_by_name("C#")
Language.find_or_create_by_name("Plain")

# Create default user
User.create(:email => 'grouppet@gmail.com', :password => 123456)
