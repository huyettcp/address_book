# use this code to create an address book in sinatra
# create an input form
# add a person
# list people
require 'pg'
require 'pry'

puts "Hey baby, what do I call an angel like you?"
first_name = gets.chomp
puts "Can I at least get a last name?"
last_name = gets.chomp
puts "Well, how old are you?"
age = gets.chomp
# get all the inputs
# put them in the string
# make it work

# this establishes a connection to the database
# db = PG.connect(:dbname => 'address_book',
#   :host => 'localhost')
# executing sql code
# passing a string of sql to the database

# insert into database
db = PG.connect(:dbname => 'address_book',host => 'localhost')

sql = "insert into contacts (first) values ('#{name}')"
db.exec(sql)
sql = "select first, age from contacts"
db.exec(sql) do |result|
  result.each do |row|
    puts row
  end
end
# db.close
db.close

# reads from database
# db = PG.connect(:dbname => 'address_book',
#   :host => 'localhost')
# sql = "select first, age from contacts"
# db.exec(sql) do |result|
#   result.each do |row|
#     puts row
#   end
# end
# db.close