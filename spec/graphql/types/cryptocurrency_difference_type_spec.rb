require 'rails_helper'

module Types
  RSpec.describe CryptocurrencyDifferenceType do
    subject { described_class }

    it 'has :from_crypto field of String! type' do
      is_expected.to have_field(:from_crypto).of_type('String!')
    end

    it 'has :to_crypto field of String! type' do
      is_expected.to have_field(:to_crypto).of_type('String!')
    end

    it 'has :message field of String! type' do
      is_expected.to have_field(:message).of_type('String!')
    end

    it 'has :value field of Float! type' do
      is_expected.to have_field(:value).of_type('Float!')
    end
  end
end
