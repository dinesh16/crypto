require 'rails_helper'

RSpec.describe Nomics::Cryptocurrency, type: :model do
  describe 'Nomics api Cryptocurrency class' do
    # subject { described_class.new }

    let(:params) { { ids: ['BTC', 'XRP']} }
    let(:endpoint) { '/currencies/ticker' }
    let(:service) { described_class.new(token) }

    it 'nomics ddd call', :vcr do
      binding.pry
      response = service.call(endpoint, params)
      expect(response.status).to eq(200)
    end
  end
end
