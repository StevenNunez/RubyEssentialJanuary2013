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
  it "finds a contact by name" do
    contact = Contact.new "Guy", "a@b.com", "222-222-2222"
    contact = Contact.new "Gal", "b@c.com", "555-555-5555"
    collection = ContactCollection.new
    collection.add contact

    found = collection.find_by_name "Guy"
    found.name.must_equal "Guy"
    found.email.must_equal "a@b.com"
  end
end
