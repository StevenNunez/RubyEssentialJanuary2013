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

  def find_by_name(name)
    @contacts.find{|contact| contact.name == name}
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
    guy = Contact.new "Guy", "a@b.com", "222-222-2222"
    gal = Contact.new "Gal", "b@c.com", "555-555-5555"
    collection = ContactCollection.new
    collection.add guy
    collection.add gal

    found = collection.find_by_name "Guy"
    found.name.must_equal "Guy"
    found.email.must_equal "a@b.com"
  end

  it "returns nil if it can't find anyone" do
    collection = ContactCollection.new
    found = collection.find_by_name "Guy"
    found.must_be_nil
  end
end
