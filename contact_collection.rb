require 'minitest/autorun'
require_relative 'contact'
class ContactCollection
  def initialize
    @contacts = []
  end
  def add(contact)
    @contacts << contact
  end
  
  def count
    @contacts.count
  end
end

describe ContactCollection do
  it "can have contacts added to it" do
    contact = Contact.new "Guy", "a@b.com", "222-222-2222"
    collection = ContactCollection.new
    collection.count.must_equal 0
    collection.add contact
    collection.count.must_equal 1
  end
end
