class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index

  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end
end
