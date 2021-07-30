# frozen_string_literal: true

require 'rails_helper'

describe 'flavors' do
  it '全てのflavorを取得する' do
    get '/api/v1/flavors/'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(1004)
  end

  it 'flavorを一つ取得する' do
    get "/api/v1/flavors/#{rand(1..1004)}"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(1)
  end
end
