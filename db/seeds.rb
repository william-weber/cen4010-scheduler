# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
User.create!( :n_number => 'n00000000', :password => 'password123', :password_confirmation => 'password123', :first_name => 'Temp', :last_name => 'Admin', :email => 'temp@admin.temp')
user = User.first
user.is_admin = true
user.save!

comp_sci = DegreeProgram.create!( :name => "Computer Science" )
Course.create!( :identifier => "COP2220", :name => "Computer Science I", :offered_odd_fall => true, :offered_even_spring => true, :offered_even_fall => true, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "COT3100", :name => "Comp Structures", :offered_odd_fall => true, :offered_even_spring => true, :offered_even_fall => true, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "COP3503", :name => "Computer Science II", :offered_odd_fall => true, :offered_even_spring => true, :offered_even_fall => true, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "COP3530", :name => "Data Structures", :offered_odd_fall => true, :offered_even_spring => true, :offered_even_fall => true, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "CDA3101", :name => "Intro to Comp Hrdwr", :offered_odd_fall => true, :offered_even_spring => true, :offered_even_fall => true, :offered_odd_spring => true, :degree_program => comp_sci ) 

Course.create!( :identifier => "COT3210", :name => "Computability & Automata", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "COP3601", :name => "Intro System Software", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 

Course.create!( :identifier => "CIS4253", :name => "Legal/Ethical Issues", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )
Course.create!( :identifier => "COP4710", :name => "Data Modeling", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci ) 
Course.create!( :identifier => "COP4610", :name => "Operating Systems", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci ) 

Course.create!( :identifier => "COP4620", :name => "Constr Language Trans", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "CEN4010", :name => "Software Engineering", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "CNT4504", :name => "Ntwk & Dist Proc", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "COP4813", :name => "Internet Programming", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 

Course.create!( :identifier => "CAP4630", :name => "Artificial Intelligence", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )
Course.create!( :identifier => "CAP4831", :name => "Modeling & Simulation", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )

Course.create!( :identifier => "CAP4770", :name => "Data Mining", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 
Course.create!( :identifier => "CEN4801", :name => "Systems Integration", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 

Course.create!( :identifier => "CEN4943", :name => "Software Dev Practicum", :offered_odd_fall => false, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )

Course.create!( :identifier => "CIS4362", :name => "Computer Cryptography", :offered_odd_fall => false, :offered_even_spring => true, :offered_even_fall => false, :offered_odd_spring => true, :degree_program => comp_sci ) 

Course.create!( :identifier => "COT4400", :name => "Analysis of Algorithms", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )
Course.create!( :identifier => "COT4111", :name => "Computational Structures II", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )
Course.create!( :identifier => "COT4461", :name => "Computational Biology", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )
Course.create!( :identifier => "COT4560", :name => "Applied Graph Theory", :offered_odd_fall => true, :offered_even_spring => false, :offered_even_fall => true, :offered_odd_spring => false, :degree_program => comp_sci )
