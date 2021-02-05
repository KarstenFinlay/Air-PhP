require 'user'

describe User do

  describe '.create' do
    it 'should create a user' do
      user = User.create(email: 'email@email.com', password: '1234')

      expect(user).to be_a User
      expect(user.email).to eq'email@email.com'
    end
  end

  describe '.find' do
    it 'should find a user by thier ID' do
      user = User.create(email: 'email@email.com', password: '1234')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if no ID is present' do
      expect(User.find(id: nil)).to eq nil
    end
  end

end
