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

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "airphp_test")
    else
      connection = PG.connect(dbname: "airphp")
    end

    return nil unless id
    user = connection.exec("SELECT * FROM users WHERE id = #{id}")
    User.new(id: user[0]['id'], email: user[0]['email'], password: user[0]['password'])
  end

end
