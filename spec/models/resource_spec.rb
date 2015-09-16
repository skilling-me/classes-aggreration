require 'rails_helper'

RSpec.describe Resource, type: :model do

  describe "Model unit testing" do
    it 'is valid with params: url, title' do
      expect(build(:resource)).to be_valid
    end

    context 'is invalid with params' do
      it { is_expected.to validate_presence_of :title }
      it { is_expected.to validate_presence_of :url }
      it "is invalid with a duplicate url" do
        create(:resource, url: 'http://example.com')
        resource = build(:resource, url: 'http://example.com')
        resource.valid?
        expect(resource.errors[:url]).to include("has already been taken")
      end
    end
  end

  describe "Associations" do
    it { is_expected.to have_many :categorisations }
    it { is_expected.to have_many :categories }
    it { is_expected.to have_many :reviews }
  end

end
