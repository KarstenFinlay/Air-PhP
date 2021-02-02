require 'pg'

def setup_test_database
  connection = PG.connect(dbname: "airphp_test")
  connection.exec("TRUNCATE listings;")
end
