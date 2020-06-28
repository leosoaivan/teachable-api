require 'rails_helper'

RSpec.describe "GET /users/:id", type: :request do
  let(:url) { "/users/:id"}

  context 'with existing gradebooks' do
    let(:user) { create(:user_with_gradebooks) }
    let(:params) do
      {
        user_id: user.id
      }
    end

    before(:each) do
      login user
      get url, params: params
    end

    it 'returns a successful response with data' do
      json_response = JSON.parse(response.body)['data']

      expect(response.status).to eq 200
      expect(json_response).to_not be nil
      expect(json_response['user']).to_not be nil
      expect(json_response['gradebooks']).to_not be_empty
    end
  end

  context 'with no gradebooks' do
    let(:user) { create(:user) }
    let(:params) do
      {
        user_id: user.id
      }
    end

    before(:each) do
      login user
      get url, params: params
    end

    it 'returns a successful response with empty data' do
      json_response = JSON.parse(response.body)['data']

      expect(response.status).to eq 200
      expect(json_response).to_not be nil
      expect(json_response['user']).to_not be nil
      expect(json_response['gradebooks']).to be_empty
    end
  end
end
