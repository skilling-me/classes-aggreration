require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Model unit testing" do
    it 'is valid with params: title, slug' do
      expect(build(:category)).to be_valid
    end

    context 'is invalid with params' do
      it { is_expected.to validate_presence_of :slug }
      it { is_expected.to validate_presence_of :title }
      it "is invalid with a duplicate slug" do
        create(:category, slug: 'SLUG')
        category = build(:category, slug: 'SLUG')
        category.valid?
        expect(category.errors[:slug]).to include("has already been taken")
      end
    end
  end

  describe "Associations" do
    it { is_expected.to have_many :categorisations }
    it { is_expected.to have_many :resources }
  end

end
