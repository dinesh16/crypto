module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :cryptocurrencies_by_ids, resolver: Queries::CryptocurrenciesByIds
    field :cryptocurrencies_by_dynamic_params, resolver: Queries::CryptocurrenciesByDynamicParams
  end
end
