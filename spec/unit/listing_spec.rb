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
    listing = Listing.create(name: "Bill Gates Island")

    expect(listing).to be_a Listing
    expect(listing.name).to eq "Bill Gates Island"

    expect(Listing.all).to include("Bill Gates Island")
    end
  end

  describe '.request' do
    it 'should enable a user to request a listing' do
      listing = Listing.create(name: 'Steve Jobs Hood')
      updated_listing = Listing.request(id: listing.id)

      expect(updated_listing).to be_a Listing
      expect(updated_listing.id).to eq listing.id
      expect(updated_listing.available).to eq "f"
    end
  end

end
