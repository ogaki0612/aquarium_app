class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @aquas = @user.aquas
  end
end
