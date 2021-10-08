module Queries
  class Drop < Queries::BaseQuery
    graphql_name "something"
    description "Return all favourites by party uuid"

    type [String], null: true

    def resolve
      # party = Party.find_by!(uuid: args[:party_uuid])
      # party&.wishlist&.favourites&.map(&:vehicle_configuration_id)
      ["HEllo", "GEM", "INDIA"]
    end
  end
end
