# Nomics::Cryptocurrency.new(["BTC", "OMG"]).currencies_by_ids
module Nomics
  class Cryptocurrency < Nomics::Base
    attr_reader :params
    def initialize(params)
      @params = params
    end

    def currencies_by_ids
      call(currency_ticker_endpoint, params)
    end

    def currencies_by_dynamic_params
      call(currency_ticker_endpoint, params)
    end

    private

    def currency_ticker_endpoint
      '/currencies/ticker'
    end
  end
end
