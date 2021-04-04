require 'rails_helper'

describe 'results' do
  it '全ての診断結果を取得する' do
    get '/api/v1/results/'
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(15)
  end

  it '診断結果を一つ取得する' do
    get "/api/v1/results/#{rand(1..15)}"
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
    # データの個数を確認する。
    expect(json.length).to eq(1)
  end
end
