# frozen_string_literal: true

class ProjectsPage < SitePrism::Page
  set_url 'http://testautomate.me/redmine/projects'
  # sections
  section :menu, MenuSection, '#top-menu'
  # elements
  element :avaialble_projects, '#projects-index'
  element :add_project, '.icon icon-add'
  element :filters, '#filters > legend'
  element :add_filter, 'add_filter_select'
  element :options, '#options > legend'
  element :apply, '.icon icon-checked'
  element :reload, 'icon icon-reload'
  element :save, 'icon icon-save'
end
