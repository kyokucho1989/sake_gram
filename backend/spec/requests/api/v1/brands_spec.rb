# frozen_string_literal: true

require 'rails_helper'

describe 'brands' do
  it '銘柄を一つ取得する' do
    get "/api/v1/brands/#{rand(1..100)}"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(2)
  end
end
