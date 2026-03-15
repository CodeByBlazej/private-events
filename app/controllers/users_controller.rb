class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def event_params
    params.expect(user: [ :name ])
  end
end
