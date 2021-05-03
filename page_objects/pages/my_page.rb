# frozen_string_literal: true

class MyPage < SitePrism::Page
  set_url 'http://testautomate.me/redmine/my/page'
  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :header, '#header > h1'
  element :assigned_issues, '#block-issuesassignedtome'
  element :reported_issues, '#block-issuesreportedbyme'
  element :page_items, '#block-select'
end
