module Queries
  class CryptocurrencyDifferenceByValue < Queries::BaseQuery
    graphql_name 'CryptocurrenciesDifferenceByValue'
    description 'Calculate the price of one cryptocurrency from another.Ie: 1BTC = $100, 1ETH = $50, So 1ETH == 0.5BTC'

    argument :from_crypto, ID, required: true
    argument :to_crypto, ID, required: true

    type Types::CryptocurrencyDifferenceType, null: true

    def resolve(args)
      from_crypto_id = args[:from_crypto].upcase
      to_crypto_id = args[:to_crypto].upcase

      response = Nomics::Cryptocurrency.new(params(from_crypto_id, to_crypto_id)).currencies_by_params
      results = response.parse

      raise GraphQL::ExecutionError, 'Please pass valid values to from_crypto and to_crypto args' if results.count < 2

      calc(from_crypto_id, to_crypto_id, results)
    end

    private

    def calc(from_crypto_id, to_crypto_id, results)
      from_crypto = find_crypto_order(results, from_crypto_id)
      to_crypto = find_crypto_order(results, to_crypto_id)

      price_diff = to_crypto['price'].to_f / from_crypto['price'].to_f

      {
        from_crypto: from_crypto_id,
        to_crypto: to_crypto_id,
        message: %(1 #{to_crypto_id} == #{price_diff} #{from_crypto_id}),
        value: price_diff
      }
    end

    def find_crypto_order(results, crypto_id)
      results.select { |result| result['id'] == crypto_id }.first
    end

    def params(from_crypto_id, to_crypto_id)
      {
        ids: [from_crypto_id, to_crypto_id].join(',')
      }
    end
  end
end
