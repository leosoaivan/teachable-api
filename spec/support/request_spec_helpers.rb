module RequestSpecHelpers
  def login user
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
    JWT.decode(token_from_request, Rails.application.credentials[:JWT_SECRET], true)
  end
end

RSpec.configure do |c|
  c.include RequestSpecHelpers
end