require 'rails_helper'

describe 'breweries' do
  it '全てのbreweryを取得する' do
    get '/api/v1/breweries/'
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(1703)
  end

  it 'breweryを一つ取得する' do
    get "/api/v1/breweries/#{rand(1..1703)}"
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(2)
  end
end
