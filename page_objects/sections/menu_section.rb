# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :login, 'a.login'
  element :register, 'a.register'
  element :logged_as, '#loggedas'
  element :my_page, '.my-page'
end
