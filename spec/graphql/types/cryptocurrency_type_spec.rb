require 'rails_helper'

module Types
  RSpec.describe CryptocurrencyType do
    subject { described_class }

    it 'has :id field of String! type' do
      is_expected.to have_field(:id).of_type('String!')
    end

    it 'has :currency field of String! type' do
      is_expected.to have_field(:currency).of_type('String!')
    end

    it 'has :symbol field of String! type' do
      is_expected.to have_field(:symbol).of_type('String!')
    end

    it 'has :name field of String type' do
      is_expected.to have_field(:name).of_type('String')
    end

    it 'has :logo_url field of String type' do
      is_expected.to have_field(:logo_url).of_type('String')
    end

    it 'has :status field of String type' do
      is_expected.to have_field(:status).of_type('String')
    end

    it 'has :price field of String! type' do
      is_expected.to have_field(:price).of_type('String!')
    end

    it 'has :price_date field of String type' do
      is_expected.to have_field(:price_date).of_type('String')
    end

    it 'has :price_timestamp field of String type' do
      is_expected.to have_field(:price_timestamp).of_type('String')
    end

    it 'has :circulating_supply field of String type' do
      is_expected.to have_field(:circulating_supply).of_type('String')
    end

    it 'has :max_supply field of String type' do
      is_expected.to have_field(:max_supply).of_type('String')
    end

    it 'has :market_cap field of String type' do
      is_expected.to have_field(:market_cap).of_type('String')
    end

    it 'has :market_cap_dominance field of String type' do
      is_expected.to have_field(:market_cap_dominance).of_type('String')
    end

    it 'has :num_exchanges field of String type' do
      is_expected.to have_field(:num_exchanges).of_type('String')
    end

    it 'has :num_pairs field of String type' do
      is_expected.to have_field(:num_pairs).of_type('String')
    end

    it 'has :num_pairs_unmapped field of String type' do
      is_expected.to have_field(:num_pairs_unmapped).of_type('String')
    end

    it 'has :first_candle field of String type' do
      is_expected.to have_field(:first_candle).of_type('String')
    end

    it 'has :first_trade field of String type' do
      is_expected.to have_field(:first_trade).of_type('String')
    end

    it 'has :first_order_book field of String type' do
      is_expected.to have_field(:first_order_book).of_type('String')
    end

    it 'has :rank field of String type' do
      is_expected.to have_field(:rank).of_type('String')
    end

    it 'has :rank_delta field of String type' do
      is_expected.to have_field(:rank_delta).of_type('String')
    end

    it 'has :high field of String type' do
      is_expected.to have_field(:high).of_type('String')
    end

    it 'has :high_timestamp field of String type' do
      is_expected.to have_field(:high_timestamp).of_type('String')
    end
  end
end
