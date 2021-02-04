require 'user'

describe User do

  describe '.create' do
    it 'should create a user' do
      user = User.create(email: 'email@email.com', password: '1234')

      expect(user).to be_a User
      expect(user.email).to eq'email@email.com'
    end
  end


end
