class PostsController < ApplicationController
  def create
    @post = Post.create(post_params)
    respond_to do |format|
      format.html { redirect_to comment_path(params[:comment_id])  }
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(comment_id: params[:comment_id])
  end
end
