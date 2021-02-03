require 'pg'

class Listing

  attr_reader :id, :name, :available

  def initialize(id:, name:, available:)
    @id = id
    @name = name
    @available = available
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end
    result = connection.exec("SELECT * FROM listings;")
    result.map { |listing| Listing.new(id: listing['id'], name: listing['name'], available: listing['available'])}

  end

  def self.create(name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    listing = connection.exec("INSERT INTO listings (name, available) VALUES ('#{name}', TRUE) RETURNING id, name, available;").first
    Listing.new(id: listing['id'], name: listing['name'], available: listing['available'])
  end

  def self.request(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    listing = connection.exec("UPDATE listings SET available = FALSE WHERE id=#{id} RETURNING id, name, available;").first
    Listing.new(id: listing['id'], name: listing['name'], available: listing['available'])

  end

end
