require "rails_helper"

module Queries
  module Wishlists
    RSpec.describe CryptocurrenciesByIds, type: :request do
      describe ".resolve" do
        let(:ids) {['BTC', 'XRP']}
        let(:mock_result) { { success: 'ok' } }

        before do
          expect_any_instance_of(described_class).to receive(:query).and_return(mock_result)
        end

        it "returns cryptocurrencies by ids" do
          post "/graphql", params: { query: query(ids) }

          result = data[:cryptocurrenciesByIds]
          expect(result.symbolize_keys).to eq(mock_result)
          expect(errors).to be_nil
        end

        def query(ids)
          <<~GQL
            query {
              cryptocurrenciesByIds(ids: #{ids})
            }
          GQL
        end
      end
    end
  end
end
