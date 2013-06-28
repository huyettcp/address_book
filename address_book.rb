
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
require 'rainbow'



get '/' do
  erb :index
end


get '/contacts' do
  puts "we're connecting to the database".color(:blue)
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  sql = "SELECT * FROM contacts"
  @contacts = db.exec("SELECT * FROM contacts")
  db.close
  puts "database is closing"
  erb :contacts
end

post '/contacts' do
  first = params[:first]
  last = params[:last]
  age = params[:age]
  sql = "INSERT INTO CONTACTS (first, last, age) VALUES ('#{first}', '#{last}', #{age})"
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  db.exec(sql)
  db.close
  redirect to '/contacts'

end

get '/contacts/new' do
  erb :form
end

get '/contacts/:name' do
  @user_name = params[:name]
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  sql = "SELECT * FROM contacts WHERE first = '#{@user_name}'"
  @contact = db.exec(sql).first
  db.close
  erb :contact
end


