class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.order(created_at: :desc).limit(20)
  end

  def show

    @post = Post.find params[:id]
    @comment = Comment.new
  end
end
