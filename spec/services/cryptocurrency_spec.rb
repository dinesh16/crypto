require 'rails_helper'

RSpec.describe Nomics::Cryptocurrency, type: :model do
  describe 'Nomics api Cryptocurrency currencies/ticker' do

    let(:ids) { ['BTC', 'XRP'] }
    let(:params) {{ ids: ids.join(',') }}
    let(:service) { described_class.new(params) }

    describe 'currencies_by_ids', :vcr do
      before do
        @response = service.currencies_by_ids
        @result = @response.parse
      end

      it 'expect successful call for currencies_by_ids and BTC and XRP on the result' do
        expect(@response.status).to eq(200)

        expect(@result.count).to eq(ids.count)
        expect(@result.pluck("id")).to eq(ids)

        btc = @result.select {|res| res['id'] == 'BTC' }.first
        expect(btc['symbol']).to eq('BTC')
        expect(btc['price']).to be_present
        expect(btc['status']).to eq('active')
        expect(btc['circulating_supply']).to be_present
      end
    end

  end
end
