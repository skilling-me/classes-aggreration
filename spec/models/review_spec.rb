require 'rails_helper'

RSpec.describe Review, type: :model do

  describe "Model unit testing" do
    it 'is valid with params: user, resource, rating and comment' do
      expect(build(:review)).to be_valid
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :resource }
  end

end
