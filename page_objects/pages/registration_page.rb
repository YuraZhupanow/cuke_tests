# frozen_string_literal: true

class RegistrationPage < SitePrism::Page
  set_url 'http://testautomate.me/redmine/account/register'
  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :user_login, '#user_login'
  element :user_password, '#user_password'
  element :user_password_confirmation, '#user_password_confirmation'
  element :user_firstname, '#user_firstname'
  element :user_lastname, '#user_lastname'
  element :user_mail, '#user_mail'
  element :submit_button, '#new_user > input[type=submit]:nth-child(4)'
end
