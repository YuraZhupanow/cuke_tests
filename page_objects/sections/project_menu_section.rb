# frozen_string_literal: true

class ProjectMenuSection < SitePrism::Section
  element :projects, '.projects'
  element :activity, '.activity'
  element :issues, '.issues'
  element :projects, '.projects'
  element :spent_time, '.time-entries'
  element :gantt, '.gantt'
  element :calendar, '.calendar'
  element :news, '.news'
end