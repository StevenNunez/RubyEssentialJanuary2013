require 'minitest/autorun'

class Contact
end

describe Contact do
  it "is initialized with 3 values" do
    name = "Steven Nunez"
    email = "steven.nunez@gmail.com"
    phone = "212-867-5309"
    contact = Contact.new name, email, phone
  end
end
