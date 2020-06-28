# frozen_string_literal: true

require 'rails_helper'
require 'json'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }
  end

  context 'when user is not signed up' do
    before { post url, params: params }

    it 'creates and returns a new with a successful status' do
      json_response = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(json_response['id']).to_not be nil
      expect(json_response['email']).to eq 'user@example.com'
    end
  end

  context 'when user already exists' do
    before do
      create :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns errors with a bad request status' do
      json_response = JSON.parse(response.body)

      expect(response.status).to eq 400
      expect(json_response['errors'].first['title']).to eq('Bad Request')
    end
  end
end
