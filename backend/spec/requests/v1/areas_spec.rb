require 'rails_helper'

describe 'areas' do
  it '全てのareaを取得する' do
    get '/api/v1/areas/'
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(48)
  end
end
