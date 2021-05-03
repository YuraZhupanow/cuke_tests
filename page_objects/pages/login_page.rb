# frozen_string_literal: true

class LoginPage < SitePrism::Page
  set_url 'http://testautomate.me/redmine/login'
  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :user_login, '#username'
  element :user_password, '#password'
  element :login_button, '#login-submit'
end
