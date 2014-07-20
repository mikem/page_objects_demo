require_relative 'page_fragment'

class BlogPostAndStats < PageFragment
  def post_title
    @element.find('h3').text
  end

  def comment_count
    @element.find('.post-stats').text.gsub('comments', '').to_i
  end
end
