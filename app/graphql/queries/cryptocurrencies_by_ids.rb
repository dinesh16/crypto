module Queries
  class CryptocurrenciesByIds < Queries::BaseQuery
    graphql_name 'CryptocurrenciesByIds'
    description 'Return cryptocurrencies by its ids, ids: ["BTC", "XRP"] returns all fields'

    argument :ids, [ID], required: true
    type GraphQL::Types::JSON, null: true

    def resolve(args)
      query(args)
    end

    def query(args)
      result = Nomics::Cryptocurrency.new(params(args)).currencies_by_ids
      result.parse
    end

    private 

    def params(args)
      { ids: args[:ids].join(',') }
    end
  end
end
