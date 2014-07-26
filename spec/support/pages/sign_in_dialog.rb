require_relative 'page'

class SignInDialog < Page
  def sign_in_as username, password
    fill_in 'Login', with: 'hammerhead'
    fill_in 'Password', with: 'deploytheyak'
    click_on 'Sign in'
  end
end
