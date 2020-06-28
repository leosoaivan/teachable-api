class UsersController < ApplicationController
  before_action :load_user

  def show
    @gradebooks = @user.gradebooks

    render json: { data: {
      user: @user,
      gradebooks: @gradebooks
    }, status: 'success' }
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end
