module Nomics
  class Base
    def call(endpoint, params)
      HTTP.get(api_url(endpoint) + params.to_query)
    rescue HTTP::Error => e
      'Something has gone wrong: ' + e.message
    end

    def api_url(endpoint)
      base_url + endpoint + '?key=' + api_key  + '&'
    end

    private

    def base_url
      credentials[:base_url]
    end

    def api_key
      credentials[:api_key]
    end

    def credentials
      @credentials ||= Rails.application.credentials.config[:nomics]
    end
  end
end
