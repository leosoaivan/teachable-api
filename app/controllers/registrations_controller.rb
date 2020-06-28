# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: resource
    else
      render json: { errors: create_error(resource) }, status: :bad_request
    end
  end

  private

  def create_error(resource)
    [
      {
        status: '400',
        title: 'Bad Request',
        detail: resource.errors,
        code: '100'
      }
    ]
  end
end
