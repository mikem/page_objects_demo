require_relative 'page'

class BlogPost < Page
  def self.visit post_id
    page.visit "/posts/#{post_id}"
    new
  end

  def create_comment text
    fill_in 'new-comment', with: text
    click_on 'Submit comment'
  end

  def navigate_to_blog_index
    click_on 'Back to all posts'
    BlogIndex.new
  end
end
