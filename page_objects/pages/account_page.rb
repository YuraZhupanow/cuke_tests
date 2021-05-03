# frozen_string_literal: true

class AccountPage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/my/account'
  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :user_first_name, '#user_firstname'
  element :user_last_name, '#user_lastname'
  element :user_mail, '#user_mail'
  element :user_language, '#user_language'
end
