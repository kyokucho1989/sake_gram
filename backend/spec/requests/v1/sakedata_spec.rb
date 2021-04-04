require 'rails_helper'

describe 'sakedata' do
  let(:sakedatum) { create(:sakedatum) }
  it '全てのsakedataを取得する' do
    sakedatum
    get '/api/v1/sakedata'
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(1)
  end

  it 'sakedataを作成する' do
    valid_params = { sakedata: '0.1,0.1,0.1,0.1,0.1,0.1' }

    #データが作成されている事を確認
    expect { post '/api/v1/sakedata', params: { sakedatum: valid_params } }.to change(Sakedatum, :count).by(+1)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
  end
end
