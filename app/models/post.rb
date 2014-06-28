class Post < ActiveRecord::Base
  has_many :comments

  def comment_count
    comments.length
  end
end
