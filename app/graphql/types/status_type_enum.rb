module Types
  class StatusTypeEnum < Types::BaseEnum
    graphql_name "StatusTypeEnum"
    description "status type enums"

    value 'ACTIVE', 'active'
    value 'INACTIVE', 'inactive'
  end
end
