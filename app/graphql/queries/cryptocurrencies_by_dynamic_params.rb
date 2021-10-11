module Queries
  class CryptocurrenciesByDynamicParams < Queries::BaseQuery
    graphql_name 'CryptocurrenciesByDynamicParams'
    description 'Return Cryptocurrencies by its ticker and other dynamic params'

    argument :ids, [ID], required: true
    argument :convert, String, required: false
    argument :intervals, [Types::IntervalTypeEnum], required: false
    argument :status, Types::StatusTypeEnum, required: false

    type [Types::CryptocurrencyType], null: true

    def resolve(args)
      response = Nomics::Cryptocurrency.new(params(args)).currencies_by_params
      response.parse
    end

    private

    def params(args)
      params = { ids: args[:ids].join(',').upcase }
      params.merge!(interval: map_intervals(args[:intervals]).join(',')) if args[:intervals].present?
      params.merge!(convert: args[:convert]) if args[:convert].present?
      params.merge!(status: args[:status].downcase) if args[:status].present?
      params
    end

    def map_intervals(intervals)
      intervals.map(&:downcase).map(&:to_sym).map do |interval|
        interval_mapping[interval] if interval_mapping.key?(interval)
      end
    end

    def interval_mapping
      {
        'one_hour': '1h',
        'one_day': '1d',
        'seven_days': '7d',
        'thirty_days': '30d',
        'once_year': '365d',
        'year_to_date': 'ytd'
      }
    end
  end
end
