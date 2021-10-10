module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :cryptocurrencies_by_ids, resolver: Queries::CryptocurrenciesByIds
    field :cryptocurrencies_by_dynamic_params, resolver: Queries::CryptocurrenciesByDynamicParams
    field :cryptocurrency_difference_by_value, resolver: Queries::CryptocurrencyDifferenceByValue
  end
end
