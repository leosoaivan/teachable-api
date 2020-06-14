class ApplicationController < ActionController::API
  # include ActionController::MimeResponds
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # respond_to :json
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:email]
  end
end
