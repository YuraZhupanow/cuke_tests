# frozen_string_literal: true

class Home < SitePrism::Page
  set_url 'http://testautomate.me/redmine/'
  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :header, '#header > h1'
end
