require 'rails_helper'

feature "User can comment", js: true do
  background do
    Post.create! title: 'Yakety Yak'
    User.create! username: 'hammerhead'
  end

  scenario "leaving a comment persists the comment and increases the comment count" do
    visit '/sign_in' # we're faking user authentication, signs us in as first user

    blog_index_page = BlogIndex.visit
    old_comment_count = blog_index_page.comment_count_for 'Yakety Yak'

    blog_post_page = blog_index_page.read 'Yakety Yak'
    blog_post_page.create_comment "Don't talk back"
    expect(blog_post_page).to have_content "Don't talk back"

    blog_index_page = blog_post_page.navigate_to_blog_index
    comment_count = blog_index_page.comment_count_for 'Yakety Yak'
    expect(comment_count).to eq old_comment_count + 1

    blog_post_page = blog_index_page.read 'Yakety Yak'
    expect(blog_post_page).to have_content "Don't talk back"
  end

  scenario "logged out user can sign in when they submit a new comment" do
    blog_post_page = BlogIndex.visit.read 'Yakety Yak'
    blog_post_page.create_comment "Don't talk back"
    SignInDialog.new.sign_in_as 'hammerhead', 'deploytheyak'
    expect(page).to have_content "Don't talk back"

    blog_post_page.refresh
    expect(page).to have_content "Don't talk back"
  end
end
