# frozen_string_literal: true

require 'rails_helper'

describe 'results' do
  it '全ての診断結果を取得する' do
    get '/api/v1/results/'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(15)
  end

  it '診断結果を一つ取得する' do
    get "/api/v1/results/#{rand(1..15)}"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(1)
  end
end
