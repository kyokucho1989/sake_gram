require 'rails_helper'

describe 'flavors' do
  it '全てのflavorを取得する' do
    get '/api/v1/flavors/'
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(1004)
  end

  it 'flavorを一つ取得する' do
    get "/api/v1/flavors/#{rand(1..1004)}"
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(1)
  end
end
