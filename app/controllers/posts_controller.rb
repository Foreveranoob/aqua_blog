class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end
end
