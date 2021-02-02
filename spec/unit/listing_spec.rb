require 'listing'

describe Listing do

  describe '.all' do
    it 'should display all listings' do
      connection = PG.connect(dbname: "airphp_test")
      connection.exec("INSERT INTO listings (name) VALUES ('Bill Gates Island');")

      listings = Listing.all
      expect(listings).to include("Bill Gates Island")
    end
  end

  describe '.create' do
    it 'should create a new listing' do
    Listing.create(name: "Bill Gates Island")

    expect(Listing.all).to include("Bill Gates Island")
    end
  end

end
