# json Helper
module JsonHelper
  def json
    @json ||= JSON.parse(response.body).with_indifferent_access
  end

  def data
    json[:data]
  end

  def errors
    json[:errors]
  end
end

RSpec.configure do |config|
  config.include JsonHelper
end
