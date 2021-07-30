# frozen_string_literal: true

require 'rails_helper'

describe 'breweries' do
  it '全てのbreweryを取得する' do
    get '/api/v1/breweries/'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(1703)
  end

  it 'breweryを一つ取得する' do
    get "/api/v1/breweries/#{rand(1..1703)}"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(2)
  end
end
