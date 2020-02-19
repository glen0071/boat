# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:source) }
  it { is_expected.to have_many(:quote_topics) }
  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:favorites) }



  let(:source) { FactoryBot.create(:source,
    title: 'Primero Tableta',
    alt_title: 'First Tablet',
    ) }
  let(:quote) { FactoryBot.create(:quote, source: source) }

  let(:sourceless_quote) { FactoryBot.create(:quote, source: nil, source_title: 'Source Title') }

  describe '#best_title' do
    it "return the combined string title" do
      expect(quote.best_title).to eq 'Primero Tableta (First Tablet)'
    end

    it "return title if alt_title '' or nil" do
      source.update alt_title: nil
      expect(quote.best_title).to eq 'Primero Tableta'
      source.update alt_title: ''
      expect(quote.best_title).to eq 'Primero Tableta'
    end

    it "return alt_title if title '' or nil" do
      source.update title: nil
      expect(quote.best_title).to eq 'First Tablet'
      source.update title: ''
      expect(quote.best_title).to eq 'First Tablet'
    end

    it "return quote.source_title if no source" do
      expect(sourceless_quote.best_title).to eq 'Source Title'
    end
  end
end
