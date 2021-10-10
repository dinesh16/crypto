module Queries
  class CryptocurrencyDifferenceByValue < Queries::BaseQuery
    graphql_name 'CryptocurrenciesDifferenceByValue'
    description 'Return Cryptocurrencies difference by its dollar value: Ie: 1BTC = $100, 1ETH = $50, therefore 1ETH == 0.5BTC'

    argument :from_crypto, ID, required: true
    argument :to_crypto, ID, required: true

    type Types::CryptocurrencyDifferenceType, null: true

    def resolve(args)
      from_crypto_id = args[:from_crypto]
      to_crypto_id = args[:to_crypto]

      results = Nomics::Cryptocurrency.new(params(from_crypto_id, to_crypto_id)).currencies_by_ids

      calc(from_crypto_id, to_crypto_id, results.parse)
    end

    def calc(from_crypto_id, to_crypto_id, results)
      from_crypto = find_crypto_order(results, from_crypto_id)
      to_crypto = find_crypto_order(results, to_crypto_id)

      from_crypto_price = from_crypto['price'].to_f
      to_crypto_price = to_crypto['price'].to_f

      price_diff = to_crypto_price / from_crypto_price

      {
        from_crypto: from_crypto_id,
        to_crypto: to_crypto_id,
        message: %(1 #{to_crypto_id} == #{price_diff} #{from_crypto_id}),
        value: price_diff
      }
    end

    private

    def find_crypto_order(results, crypto_id)
      results.select { |result| result['id'] == crypto_id }.first
    end

    def params(from_crypto_id, to_crypto_id)
      params = { 
        ids: [from_crypto_id, to_crypto_id].join(',')
      }
    end
  end
end
