# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  let(:user) { create(:user) }

  context 'when params are correct' do
    before do
      login user
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      decoded_token = decoded_jwt_token_from_response(response)
      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before do
      post '/login'
    end

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  let(:user) { create(:user) }

  before(:each) do
    login user
  end

  it 'sign_out with token' do
    token = response.headers['Authorization']
    expect(token).to be_present
    delete '/logout', headers: { Authorization: token }

    expect(response).to have_http_status(204)
  end
end
