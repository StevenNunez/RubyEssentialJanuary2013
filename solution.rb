# name, email, phone
# Steven Nunez, steven.nunez@gmail.com, 555-888-9898
# Matthew Jording, mjording@gmail.com, 555-222-9898
# Mayor Bloomberg, , 311

class Contact
  attr_accessor :name, :email, :phone
end

contacts = []

File.readlines('my_data.txt').each do |data|
  c = Contact.new
  array_of_data = data.split(", ").map do |x|
    x.strip
  end
  c.name =  array_of_data[0]
  c.email = array_of_data[1]
  c.phone = array_of_data[2]
  contacts << c
end

File.open('c.csv', 'w') { |f| f.puts "name, email, phone" }
File.open('c.csv', 'a') do |f|
  contacts.each do |contact|
    f.puts "#{contact.name}, #{contact.email}, #{contact.phone}"
  end
end
