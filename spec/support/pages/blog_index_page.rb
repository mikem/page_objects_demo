require_relative 'page'

class BlogIndex < Page
  def self.visit
    page.visit '/posts'
    new
  end

  def comment_count_for post_title
    post_containers = all('.post').map { |p| BlogPostAndStats.new p }
    post_container = post_containers.detect { |c| c.post_title == post_title }
    post_container.comment_count
  end

  def read title
    click_on title
    BlogPost.new
  end
end
