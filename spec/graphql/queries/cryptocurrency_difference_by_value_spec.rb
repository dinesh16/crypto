require 'rails_helper'

module Queries
  RSpec.describe CryptocurrencyDifferenceByValue, type: :request do
    describe '.resolve' do
      let(:params) {
        {
          from_crypto: 'XRP',
          to_crypto: 'DOGE'
        }
      }

      let(:invalid_params) {
        {
          from_crypto: 'TESTED',
          to_crypto: 'OPOP'
        }
      }

      it 'calculate the price of one cryptocurrency from another, in relation to their dollar value', :vcr do
        post '/graphql', params: { query: query(params) }

        result = data[:cryptocurrencyDifferenceByValue].with_indifferent_access
        expect(result[:fromCrypto]).to eq(params[:from_crypto])
        expect(result[:toCrypto]).to eq(params[:to_crypto])
        expect(result[:message]).to be_present
        expect(result[:value]).to be_present

        expect(errors).to be_nil
      end

      it 'return error message when invalid params', :vcr do
        post '/graphql', params: { query: query(invalid_params) }

        expect(errors).to be_present
        expect(errors.first[:message]).to include('Please pass valid values to from_crypto and to_crypto args')
      end

      def query(params)
        from = params[:from_crypto]
        to = params[:to_crypto]
        <<~GQL
          query {
            cryptocurrencyDifferenceByValue(fromCrypto: "#{from}", toCrypto: "#{to}"){
              fromCrypto
              toCrypto
              message
              value
            }
          }
        GQL
      end
    end
  end
end
