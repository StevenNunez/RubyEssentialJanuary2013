require 'csv'
require_relative 'contact'

contacts = []
CSV.open('c.csv', headers: true).each do |c|
  contacts << Contact.new(c["name"], c[" phone"], c[' email'])
end
 
puts contacts
