require 'rails_helper'

feature "User can comment", js: true do
  background do
    Post.create! title: 'Yakety Yak'
    User.create! username: 'hammerhead'
  end

  scenario "leaving a comment persists the comment and increases the comment count" do
    visit '/sign_in' # we're faking user authentication, signs us in as first user
    visit '/posts'
    old_comment_count = comment_count_for 'Yakety Yak'

    click_on 'Yakety Yak'
    fill_in 'new-comment', with: "Don't talk back"
    click_on 'Submit comment'
    expect(page).to have_content "Don't talk back"

    click_on 'Back to all posts'
    comment_count = comment_count_for 'Yakety Yak'
    expect(comment_count).to eq old_comment_count + 1

    click_on 'Yakety Yak'
    expect(page).to have_content "Don't talk back"
  end

  scenario "logged out user can sign in when they submit a new comment" do
    visit '/posts'
    click_on 'Yakety Yak'
    fill_in 'new-comment', with: "Don't talk back"
    click_on 'Submit comment'

    within '#sign-in-dialog' do
      fill_in 'Login', with: 'hammerhead'
      fill_in 'Password', with: 'deploytheyak'
      click_on 'Sign in'
    end

    expect(page).to have_content "Don't talk back"

    visit page.current_path
    expect(page).to have_content "Don't talk back"
  end

  def comment_count_for post_title
    # TODO: find the count and return as integer
    4
  end
end
