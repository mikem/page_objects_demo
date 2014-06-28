class SessionsController < ApplicationController
  def create
    session[:user_id] = User.first.try(:id)
    if request.xhr?
      head :no_content
    else
      redirect_to posts_path
    end
  end
end
