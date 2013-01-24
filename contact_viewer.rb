require 'minitest/autorun'

class ContactViewer
  def initialize(input, collection)
    input.puts welcome_message
  end

  def welcome_message
    %q{Welcome! What would you like to do?
    1. Show my contacts
    2. Add a new contact}
  end
end

describe ContactViewer do
  it "shows a welcome message" do
    fc = FakeConsole.new
    ContactViewer.new(fc, :foo)
    fc.last_message.must_match /Welcome!/
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
