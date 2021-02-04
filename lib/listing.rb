require 'pg'

class Listing

  attr_reader :id, :name, :available, :description

  def initialize(id:, name:, available:, description:)
    @id = id
    @name = name
    @available = available
    @description = description
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end
    result = connection.exec("SELECT * FROM listings;")
    result.map { |listing| Listing.new(id: listing['id'], name: listing['name'], 
                  available: listing['available'], description: listing['description'])}

  end

  def self.create(name:, description:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    listing = connection.exec("INSERT INTO listings (name, available, description) VALUES ('#{name}', TRUE, '#{description}') 
                              RETURNING id, name, available, description;").first
    Listing.new(id: listing['id'], name: listing['name'], available: listing['available'], description: listing['description'])
  end

  def self.request(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    listing = connection.exec("UPDATE listings SET available = FALSE WHERE id=#{id} RETURNING id, name, available, description;").first
    Listing.new(id: listing['id'], name: listing['name'], available: listing['available'], description: listing['description'])

  end

end
