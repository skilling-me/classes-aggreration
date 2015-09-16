require 'rails_helper'

describe ResourceDecorator do
  let!(:resource_first) { create :resource }
  let!(:review_1) { create :review, resource: resource_first, comment: "comment", rating: 1}
  let!(:review_2) { create :review, resource: resource_first, comment: "comment", rating: 2}

  let!(:resource_second) { Resource.new(title: 'title', url: 'http://example.com') }

  describe "#resource.decorate.avg_rating" do
    context 'when resource has reviews' do
      subject { resource_first.decorate.avg_rating }
      it { is_expected.to eq "1.50" }
    end

    context "when resource doesn't have any reviews" do
      subject { resource_second.decorate.avg_rating }
      it { is_expected.to eq "0.00" }
    end
  end

  describe "#resource.decorate.count_comments" do
    subject { resource_first.decorate.count_comments }
    it { is_expected.to eq 2 }
  end


end
