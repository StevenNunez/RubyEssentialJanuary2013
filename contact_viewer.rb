require 'minitest/autorun'
require_relative 'contact_collection'

class ContactViewer
  def initialize(output, input, collection)
    @output = output
    @input = input
    @collection = collection
  end

  def welcome_message
    @output.puts %q{Welcome! What would you like to do?
    1. Show my contacts
    2. Add a new contact}
  end

  def show_contacts
    @output.puts @collection.to_s
  end

  def add_contact
    @output.puts "Please enter a name:"
    name = @input.gets.chomp

    @output.puts "Please enter an email:"
    email = @input.gets.chomp

    @output.puts "Please enter an phone:"
    phone = @input.gets.chomp

    contact = Contact.new name, email, phone
    @collection.add contact
    
    @output.puts %{Contact "#{name}" Created}
  end
end

describe ContactViewer do
  it "shows a welcome message" do
    fc = FakeConsole.new
    fk = FakeKeyboard.new
    cv = ContactViewer.new(fc, fk, :foo)
    cv.welcome_message
    fc.last_message.must_match /Welcome!/
  end

  it "shows you your contacts" do 
    fc = FakeConsole.new
    fk = FakeKeyboard.new
    cc = ContactCollection.new
    cc.add "A Contact"
    cv = ContactViewer.new(fc, fk, cc)
    cv.show_contacts
    fc.last_message.must_equal "A Contact"
  end

  it "adds a contact from user input" do
    fc = FakeConsole.new
    fk = FakeKeyboard.new
    fk.responses = ["Steven\n", "guy@place.com\n", "555-555-6666\n"]
    cc = ContactCollection.new
    cv = ContactViewer.new(fc, fk, cc)
    cv.add_contact
    fc.last_message.must_equal 'Contact "Steven" Created'
    found = cc.find_by_name("Steven")
    found.name.must_equal "Steven"
    found.email.must_equal "guy@place.com"
    found.phone.must_equal "555-555-6666"
  end
end

class FakeKeyboard
  attr_reader :responses
  def gets
    responses.next
  end

  def responses=(array)
    @responses = array.to_enum
  end
end

class FakeConsole
  def puts(arg)
    @last_message = arg
  end
  def last_message
    @last_message
  end
end
