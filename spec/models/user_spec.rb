require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a first_name, email and password" do
    user = User.new(
      first_name: 'John',
      email: 'john@example.com',
      password: '123456789'
    )
    expect(user).to be_valid
  end

  describe 'validations' do

    it { is_expected.to validate_presence_of :first_name }
    it "is invalid without a first_name" do
      user = User.new(first_name: nil,
        email: 'john@example.com',
        password: '123456789'
      )
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it { is_expected.to validate_presence_of :email }
    it "is invalid without a email" do
      user = User.new(first_name: "John",
        email: nil,
        password: '123456789'
      )
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it { is_expected.to validate_presence_of :password }
    it "is invalid without a password" do
      user = User.new(first_name: "John",
        email: 'john@example.com',
        password: nil
      )
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
      User.create(
        first_name: 'John',
        email: 'john@example.com',
        password: '123456789'
      )
      user = User.new(
        first_name: 'John',
        email: 'john@example.com',
        password: '123456789'
      )
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with password less than 8 characters" do
      user = User.new(
        first_name: 'John',
        email: 'john@example.com',
        password: '1234567'
      )
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end

  end

  describe 'associations' do
    it { is_expected.to have_many :reviews }
  end

end
