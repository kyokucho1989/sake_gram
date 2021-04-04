require 'rails_helper'

describe 'health_checks' do
  it 'health_checkを確認する' do
    get '/api/v1/health_check/'
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
  end
end
