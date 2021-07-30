# frozen_string_literal: true

require 'rails_helper'

describe 'health_checks' do
  it 'health_checkを確認する' do
    get '/api/v1/health_check/'
    expect(response.status).to eq(200)
  end
end
