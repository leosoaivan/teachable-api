# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/:id/gradebooks', type: :request do
  context 'With existing gradebooks' do
    let(:user) { create(:user_with_gradebooks) }

    before(:each) do
      login user
      get user_gradebooks_path(user)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status 200
    end

    it 'returns data' do
      expect(json_response['gradebooks']).to_not be_empty
      expect(json_response['gradebooks'].size).to eq user.gradebooks.size
    end
  end

  context 'With no gradebooks' do
    let(:user) { create(:user) }

    before(:each) do
      login user
      get user_gradebooks_path(user)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status 200
    end

    it 'returns data' do
      expect(json_response['gradebooks']).to be_empty
      expect(json_response['gradebooks'].size).to eq user.gradebooks.size
    end
  end
end
