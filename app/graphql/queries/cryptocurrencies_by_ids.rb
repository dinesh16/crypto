module Queries
  class CryptocurrenciesByIds < Queries::BaseQuery
    graphql_name 'CryptocurrenciesByIds'
    description 'Retrieve a list of cryptocurrencies given set of tickers, ids: ["BTC", "XRP"] returns all fields'

    argument :ids, [ID], required: true, description: 'eg: ["BTC", "XRP"]'
    type GraphQL::Types::JSON, null: true

    def resolve(args)
      query(args)
    end

    def query(args)
      response = Nomics::Cryptocurrency.new(params(args)).currencies_by_params
      response.parse
    end

    private

    def params(args)
      { ids: args[:ids].join(',').upcase }
    end
  end
end
