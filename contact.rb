require 'minitest/autorun'

class Contact
  attr_reader :name, :email, :phone
  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
  end
end

describe Contact do
  it "is initialized with 3 values" do
    name = "Steven Nunez"
    email = "steven.nunez@gmail.com"
    phone = "212-867-5309"
    contact = Contact.new name, email, phone
  end
  
  it "sets name with the passed in value" do
    name = "Steven Nunez"
    email = "steven.nunez@gmail.com"
    phone = "212-867-5309"
    contact = Contact.new name, email, phone
    contact.name.must_equal "Steven Nunez"
  end

  it "sets email with the passed in value" do
    name = "Steven Nunez"
    email = "steven.nunez@gmail.com"
    phone = "212-867-5309"
    contact = Contact.new name, email, phone
    contact.email.must_equal "steven.nunez@gmail.com"
  end

  it "sets phone with the passed in value" do
    name = "Steven Nunez"
    email = "steven.nunez@gmail.com"
    phone = "212-867-5309"
    contact = Contact.new name, email, phone
    contact.phone.must_equal "212-867-5309"
  end

end
