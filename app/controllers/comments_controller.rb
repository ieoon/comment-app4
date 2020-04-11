class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @comments = Comment.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  def edit
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
  end

  def show
    @post = Post.new
    @posts = @comment.posts
  end

  def search
    @comments = Comment.search(params[:keyword])
  end

  private
  def comment_params
    params.require(:comment).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
