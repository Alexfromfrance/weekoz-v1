class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @course = Course.new
  end
end
