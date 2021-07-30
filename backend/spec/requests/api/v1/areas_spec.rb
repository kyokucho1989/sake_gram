# frozen_string_literal: true

require 'rails_helper'

describe 'areas' do
  it '全てのareaを取得する' do
    get '/api/v1/areas/'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json.length).to eq(48)
  end
end
