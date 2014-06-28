class CommentsController < ApplicationController
  def create
    post = Post.where(id: params[:post_id]).first
    user = User.where(id: session[:user_id]).first
    if user
      post.comments.create text: params[:text], user: user
      render json: { comment_text: params[:text] }
    else
      render json: { error: 'You must be signed in!' }, status: :unauthorized
    end
  end
end
