# frozen_string_literal: true

require 'rails_helper'

describe 'sakedata' do
  let(:sakedatum) { create(:sakedatum) }
  it '全てのsakedataを取得する' do
    sakedatum
    get '/api/v1/sakedata'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(1)
  end

  it 'sakedataを作成する' do
    valid_params = { sakedata: '0.1,0.1,0.1,0.1,0.1,0.1' }

    expect { post '/api/v1/sakedata', params: { sakedatum: valid_params } }.to change(Sakedatum, :count).by(+1)
    expect(response.status).to eq(200)
  end
end
