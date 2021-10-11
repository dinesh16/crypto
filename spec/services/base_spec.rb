require 'rails_helper'

RSpec.describe Nomics::Base, type: :model do
  describe 'Nomics api base class' do
    let(:params) { { ids: 'XRP' } }
    subject { described_class.new }

    it 'nomics api call', :vcr do
      response = subject.call('/currencies/ticker', params)
      expect(response.status).to eq(200)
    end
  end
end
