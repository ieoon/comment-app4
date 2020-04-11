class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @comments = user.comments.page(params[:page]).per(5).order("created_at DESC")
  end
end
