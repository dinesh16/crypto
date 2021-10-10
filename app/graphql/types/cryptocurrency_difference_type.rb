module Types
  class CryptocurrencyDifferenceType < Types::BaseObject
    graphql_name "CryptocurrencyDifferenceType"

    field :from_crypto, String, null: false
    field :to_crypto, String, null: false
    field :message, String, null: false
    field :value, Float, null: false
  end
end
