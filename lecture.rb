#File access
# http://www.ruby-doc.org/core-1.9.3/File.html
File.open('my_notes', 'w+'){|f| f << "learning a lot" }
# File modes
# http://ruby-doc.org/core-1.9.3/IO.html
# r+ vs w+ vs a+
# Experiment!
File.open('my_notes', 'w+'){|f| f.puts "I have such good knowlege now" }
File.open('my_notes', 'w+'){|f| f << "what the?" }

# you're gonna have a bad time...
["notes:", "I created", "a", "file writer"].each do |note|
  File.open('generated_notes', 'a+') do |f|
    f.puts note
  end
end

File.open('generated_notes', 'w+') do |f|
  ["notes:", "I created", "a", "file writer"].each do |note|
    f.puts note
  end
end

# Challenge!
# Create this file... using ruby. Call it contacts.csv
#
# name, email, phone
# Steven Nunez, steven.nunez@gmail.com, 555-888-9898
# Matthew Jording, mjording@gmail.com, 555-222-9898
# Mayor Bloomberg, , 311

# Challenge!
# Find the method to read a files contents and print them out to the screen.


#CSV
# http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html
# Load all objects 
# CSV.open 'contacts.csv' gives an array of arrays
# CSV.open 'contacts.csv', headers: true for something we can use.
# Challenge, create objects from the contents of our csv and add them to an array
# write to csv



# Ruby and the web
