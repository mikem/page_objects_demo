class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @current_user = User.where(id: session[:user_id]).first
    @post = Post.find(params[:id])
  end
end
