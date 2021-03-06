require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new(email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures mail presence' do
      user = User.new(username: 'First').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(username: 'First', email: 'sample@example.com',password: 'dawid123').save
      expect(user).to eq(true)
    end
  end
end
