require_relative 'page'

class BlogIndex < Page
  def self.visit
    page.visit '/posts'
    new
  end

  def comment_count_for post_title
    # TODO: find the count and return as integer
    4
  end

  def read title
    click_on title
    BlogPost.new
  end
end
