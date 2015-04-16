# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create test user
#User.create(:email => "admin@example.com", :first_name => "Test", :last_name => "User", :password => "password", :password_confirmation => "password")

schools = [
	School.new(name: "Software Development Academy", tuition: 10000)
]
schools.each do |s|
	if School.find_by_name(s.name).nil?
		s.save!
		puts "Creating School #{s.name}."
	end
end

school_admins = [
					SchoolAdmin.new(email: "school_admin@example.com", first_name: "School", last_name: "Admin", 
						password: "password", password_confirmation: "password", school: School.first, terms_of_use: true)
				]
school_admins.each do |s|
	if SchoolAdmin.find_by_email(s.email).nil?
		s.save!
		puts "Creating School Admin #{s.full_name}."
	end
end

donors = [
			Donor.new(email: "amy@example.com", first_name: "Amy", last_name: "Cruz", password: "password",
				password_confirmation: "password", address: "123 Some Lane, Someville CA, 98765", phone: "555-555-5555", terms_of_use: true),
			Donor.new(email: "bob@example.com", first_name: "Bob", last_name: "Smith", password: "password",
				password_confirmation: "password", address: "123 Another Lane, Elsewhere WY, 98765", phone: "555-555-5555", terms_of_use: true)
		]
donors.each do |d|
	if Donor.find_by_email(d.email).nil?
		d.save!
		puts "Creating donor #{d.full_name}."
	end
end

dors = [
			Dor.new(email: "dor@example.com", first_name: "Dept O.", last_name: "Revenue", password: "password",
				password_confirmation: "password", terms_of_use: true)
		]
dors.each do |d|
	if Dor.find_by_email(d.email).nil?
		d.save!
		puts "Creating dept. of rev #{d.full_name}."
	end
end

households = [
				Household.new(email: "betty@example.com", first_name: "Betty", last_name: "Money", password: "password",
					password_confirmation: "password", address: "1 Money Lane, Cashville $$, 99999", phone: "555-555-1234", terms_of_use: true),
				Household.new(email: "rich@example.com", first_name: "Richie", last_name: "Rich", password: "password",
					password_confirmation: "password", address: "111 Money Lane, Cashville $$, 99999", phone: "555-555-4321", terms_of_use: true)
			]
households.each do |h|
	if Household.find_by_email(h.email).nil?
		h.save!
		puts "Creating household #{h.full_name}."
	end
end