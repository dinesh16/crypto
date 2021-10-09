module Types
  class CryptocurrencyType < Types::BaseObject
    graphql_name "CryptocurrencyType"

    field :id, String, null: false
    field :currency, String, null: false
    field :symbol, String, null: false
    field :name, String, null: true
    field :logo_url, String, null: true
    field :status, String, null: true
    field :price, String, null: false
    field :price_date, String, null: true
    field :price_timestamp, String, null: true
    field :circulating_supply, String, null: true
    field :max_supply, String, null: true
    field :market_cap, String, null: true
    field :market_cap_dominance, String, null: true
    field :num_exchanges, String, null: true
    field :num_pairs, String, null: true
    field :num_pairs_unmapped, String, null: true
    field :first_candle, String, null: true
    field :first_trade, String, null: true
    field :first_order_book, String, null: true
    field :rank, String, null: true
    field :rank_delta, String, null: true
    field :high, String, null: true
    field :high_timestamp, String, null: true
  end
end
