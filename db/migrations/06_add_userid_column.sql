ALTER TABLE listings ADD COLUMN user_id integer;
ALTER TABLE listings ADD FOREIGN KEY (user_id) REFERENCES Users(id);