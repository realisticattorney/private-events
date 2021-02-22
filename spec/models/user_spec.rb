require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'password presence' do
    it 'if password not present' do
      u = User.new
      u.password = ''
      u.valid?
      expect(u.errors[:password]).to include("can't be blank")
    end

    it 'if password short present' do
      u = User.new
      u.password = 'pass'
      u.valid?
      expect(u.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'if password present' do
      u = User.new
      u.password = 'password'
      u.valid?
      expect(u.errors[:password]).to_not include("can't be blank")
    end
  end

  describe 'username email and password presence' do
    it 'if all are present' do
      expect(User.create!(password: 'pasaas', email: 'has@has.com').valid?).to be true
    end
  end
end
