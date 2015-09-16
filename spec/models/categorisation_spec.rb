require 'rails_helper'

RSpec.describe Categorisation, type: :model do
  describe "Model unit testing" do
    it 'is valid with params: category, resource' do
      expect(build(:categorisation)).to be_valid
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to :category }
    it { is_expected.to belong_to :resource }
  end
end
