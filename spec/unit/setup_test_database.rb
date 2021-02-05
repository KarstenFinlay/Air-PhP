require 'pg'

def setup_test_database
  connection = PG.connect(dbname: "airphp_test")

  connection.exec("ALTER TABLE listings DROP CONSTRAINT listings_user_id_fkey;")
  connection.exec("ALTER TABLE bookings DROP CONSTRAINT bookings_user_id_fkey;")
  connection.exec("ALTER TABLE bookings DROP CONSTRAINT bookings_listing_id_fkey;")
  connection.exec("TRUNCATE listings;")
  connection.exec("TRUNCATE users;")
  connection.exec("TRUNCATE bookings;")
  connection.exec("ALTER TABLE listings ADD FOREIGN KEY (user_id) REFERENCES Users(id);")
  connection.exec("ALTER TABLE bookings ADD FOREIGN KEY (user_id) REFERENCES users(id);")
  connection.exec("ALTER TABLE bookings ADD FOREIGN KEY (listing_id) REFERENCES listings(id);")
  
end
