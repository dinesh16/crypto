require "rails_helper"

module Queries
  RSpec.describe CryptocurrenciesByDynamicParams, type: :request do
    describe ".resolve" do
      let(:mock_result) { { success: 'ok' } }
      let(:params) {
        {
          ids: ['BTC', 'XRP'],
          intervals: 'THIRTY_DAYS'
        }
      }

      let(:invalid_params) {
        {
          ids: ['GGGGGG', 'SUSUSU'],
          intervals: 'THIRTY_DAYS'
        }
      }

      it "returns cryptocurrencies by ticker and other dynamic params", :vcr do
        post "/graphql", params: { query: query(params) }

        result = data[:cryptocurrenciesByDynamicParams]
        btc = result.select {|res| res['id'] == 'BTC' }.first

        expect(params[:ids]).to include(btc['id'])
        expect(btc['price'].to_f).to be_positive
        expect(btc['circulatingSupply']).to be_present

        expect(errors).to be_nil
      end

      it "returns empty when invalid params submitted", :vcr do
        post "/graphql", params: { query: query(invalid_params) }

        result = data[:cryptocurrenciesByDynamicParams]
        expect(result).to be_empty
      end

      it "should raie gql error when invalid arg submitted." do
        params.merge!(intervals: "INVALID")
        post "/graphql", params: { query: query(params) }

        expect(errors).to be_present
        expect(errors.first[:message]).to include('has an invalid value')
      end

      def query(params)
        ids = params[:ids]
        intervals = params[:intervals]
        <<~GQL
          query {
            cryptocurrenciesByDynamicParams(ids: #{ids}, intervals: [#{intervals}]){
              id
              status
              circulatingSupply
              maxSupply
              name
              symbol
              price
            }
          }
        GQL
      end
    end
  end
end
