require 'pg'

class Listing

  attr_reader :id, :name, :available, :description, :price

  def initialize(id:, name:, available:, description:, price:)
    @id = id
    @name = name
    @available = available
    @description = description
    @price = price
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end
    result = connection.exec("SELECT * FROM listings;")
    result.map { |listing| Listing.new(id: listing['id'], name: listing['name'], 
                  available: listing['available'], description: listing['description'], price: listing["price"])}

  end

  def self.create(name:, description:, price:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    listing = connection.exec("INSERT INTO listings (name, available, description, price, user_id) VALUES ('#{name}', TRUE, '#{description}', '#{price}', '#{user_id}') 
                              RETURNING id, name, available, description, price, user_id;").first
    Listing.new(id: listing['id'], name: listing['name'], available: listing['available'], description: listing['description'], price: listing["price"], user_id: listing['user_id'])
  end

  def self.request(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    listing = connection.exec("UPDATE listings SET available = FALSE WHERE id=#{id} RETURNING id, name, available, description, price;").first
    Listing.new(id: listing['id'], name: listing['name'], available: listing['available'], description: listing['description'], price: listing["price"])

  end

end
