module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :drop, resolver: Queries::Drop

    # TODO: remove me
    field :test_field, String, null: false, description: "An example field added by the generator"

    def test_field
      "Hello World!"
    end
  end
end


# module Types
#   class QueryType < Types::BaseObject
#     # Parties.
#     field :party_by_uuid, resolver: Queries::Parties::PartyByUuid
#     field :party_by_lead_manager_id, resolver: Queries::Parties::PartyByLeadManagerId

#     # Credit checks
#     field :credit_check_by_uuid, resolver: Queries::CreditChecks::CreditCheckByUuid, cache: true


#     def all_employment_histories
#       EmploymentHistory.where(party_id: 1)
#     end
#   end
# end