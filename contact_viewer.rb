require 'minitest/autorun'
require_relative 'contact_collection'

class ContactViewer
  def initialize(output, collection)
    @output = output
    @collection = collection
  end

  def welcome_message
    @output.puts %q{Welcome! What would you like to do?
    1. Show my contacts
    2. Add a new contact}
  end

  def show_contacts
    @output.puts @collection
  end
end

describe ContactViewer do
  it "shows a welcome message" do
    fc = FakeConsole.new
    cv = ContactViewer.new(fc, :foo)
    cv.welcome_message
    fc.last_message.must_match /Welcome!/
  end

  it "shows you your contacts" do 
    fc = FakeConsole.new
    cc = ContactCollection.new
    cc.add "A contact"
    cv = ContactViewer.new(fc, cc)
    cv.show_contacts
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
