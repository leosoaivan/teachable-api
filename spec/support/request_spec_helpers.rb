# frozen_string_literal: true

module RequestSpecHelpers
  def login(user)
    params = {
      user: {
        email: user.email,
        password: user.password
      }
    }
    post '/login', params: params
  end

  def decoded_jwt_token_from_response(response)
    token_from_request = response.headers['Authorization'].split(' ').last
    JWT.decode(token_from_request, Rails.application.credentials[:jwt_secret], true)
  end

  def json_response
    JSON.parse(response.body)['data']
  end
end

RSpec.configure do |c|
  c.include RequestSpecHelpers, type: :request
end
