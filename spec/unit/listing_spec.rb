require 'listing'

describe Listing do

  describe '.create' do
    it 'should create a new listing' do
      new_listing =  Listing.create("Bill Gates Island")

      expect(new_listing).to eq "Bill Gates Island"

    end
  end

end
