module Types
  class IntervalTypeEnum < Types::BaseEnum
    graphql_name 'IntervalTypeEnum'
    description 'interval type enums'

    value 'ONC_HOUR', '1h'
    value 'ONE_DAY', '1d'
    value 'SEVEN_DAYS', '7d'
    value 'THIRTY_DAYS', '30d'
    value 'ONCE_YEAR', '365d'
    value 'YEAR_TO_DATE', 'ytd'
  end
end
