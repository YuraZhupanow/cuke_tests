# frozen_string_literal: true

class IssuesPage < SitePrism::Page
  # set_url "https://testautomate.me/redmine/projects/#{@project.identifier}/issues"

  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :add_issue, '.new-issue'
end
