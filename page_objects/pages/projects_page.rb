# frozen_string_literal: true

class ProjectsPage < SitePrism::Page
  set_url 'https://testautomate.me/redmine/projects'
  # sections
  section :menu, MenuSection, '#top-menu'
  section :menu, ProjectMenuSection, '#main-menu'
  # elements
  element :page_header, '.current-project'
  element :available_projects, '#projects-index'
  element :add_project_button, '.icon-add'
  element :filters, '#filters > legend'
  element :add_filter, 'add_filter_select'
  element :options, '#options > legend'
  element :apply, '.icon icon-checked'
  element :reload, 'icon icon-reload'
  element :save, 'icon icon-save'

  def create_project(project)
    self.add_project_button.click
    find('#project_name').set(project.name.to_s)
    find('#project_identifier').set(project.identifier.to_s)
    click_button('Create')
  end
end
