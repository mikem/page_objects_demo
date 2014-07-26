class Page
  extend Capybara::DSL
  include Capybara::DSL

  def refresh
    page.visit page.current_path
  end
end
