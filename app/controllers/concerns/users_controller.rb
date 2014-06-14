class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pins = @user.pins.order(created_at: :desc)
  end
end
