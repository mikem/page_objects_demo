require_relative 'page_fragment'

class SignInDialog < PageFragment
  def sign_in_as username, password
    @element.fill_in 'Login', with: 'hammerhead'
    @element.fill_in 'Password', with: 'deploytheyak'
    @element.click_on 'Sign in'
  end
end
