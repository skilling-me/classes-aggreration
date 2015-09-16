require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a first_name, email and password" do
    #user = User.new(
     # first_name: 'John',
     # email: 'john@example.com',
     # password: '123456789'
   # )
    expect(build(:user)).to be_valid
  end

  describe 'validations' do

    it { is_expected.to validate_presence_of :first_name }
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it { is_expected.to validate_presence_of :email }
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it { is_expected.to validate_presence_of :password }
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
      create(:user, email: 'john@example.com')
      user = build(:user, email: 'john@example.com')
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with password less than 8 characters" do
      user = build(:user, password: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end

  end

  describe 'associations' do
    it { is_expected.to have_many :reviews }
  end

end
