class User

  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    user = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email, password;").first
    User.new(id: user['id'], email: user['email'], password: user['password'])
  end

end
