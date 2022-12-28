# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:source) }
  it { is_expected.to have_many(:quote_topics) }
  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:favorites) }

  let(:source) { FactoryBot.create(:source) }
  let(:quote) { FactoryBot.create(:quote, source:) }

  describe '#best_title' do
    it 'return the combined string title' do
      expect(quote.best_title).to eq 'Primero Tableta (First Tablet), p. 7'
    end

    it "return title with page if alt_title '' or nil" do
      source.update alt_title: nil
      expect(quote.best_title).to eq 'Primero Tableta, p. 7'
    end

    it 'return quote.source_title if no source' do
      quote.update source: nil
      expect(quote.best_title).to eq 'Source Title'
    end
  end
end
