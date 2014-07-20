require_relative 'page'

class BlogIndex < Page
  def self.visit
    page.visit '/posts'
    new
  end

  def comment_count_for post_title
    post_containers = all('.post')
    post_container = post_containers.detect { |c| c.find('h3').text == post_title }
    post_stats = post_container.find('.post-stats').text
    post_stats.gsub('comments', '').to_i
  end

  def read title
    click_on title
    BlogPost.new
  end
end
