# frozen_string_literal: true

class GradebooksController < ApplicationController
  before_action :set_user

  def index
    json_response(
      {
        gradebooks: @user.gradebooks
      }
    )
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
