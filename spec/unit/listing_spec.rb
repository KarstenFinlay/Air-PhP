require 'listing'

describe Listing do

  describe '.all' do
    it 'should display all listings' do
      Listing.create(name: 'Bill Gates Island', description: "5 bedroom house", price: 99)

      listings = Listing.all
      expect(listings[0].name).to eq ("Bill Gates Island")
      expect(listings[0].description).to eq ("5 bedroom house")
      expect(listings[0].price).to eq ("99")
    end
  end

  describe '.create' do
    it 'should create a new listing' do
      listing = Listing.create(name: "Bill Gates Island", description: "5 bedroom house", price: 99)

      expect(listing).to be_a Listing
      expect(listing.name).to eq "Bill Gates Island"
      expect(listing.description).to eq "5 bedroom house"
      expect(listing.price).to eq "99"

    end
  end

  describe '.request' do
    it 'should enable a user to request a listing' do
      listing = Listing.create(name: 'Steve Jobs Hood', description: "5 bedroom house", price: 99)
      updated_listing = Listing.request(id: listing.id)

      expect(updated_listing).to be_a Listing
      expect(updated_listing.id).to eq listing.id
      expect(updated_listing.available).to eq "f"
    end
  end

end
