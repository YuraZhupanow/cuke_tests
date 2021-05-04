Given /^I am not logged in visitor$/ do
  @home_page = Home.new
  @home_page.load
  expect(@home_page.menu.login).to be_present
end

When /^I register (admin|developer) user via Redmine (UI|API)$/ do |user_role, reg_type|
  user = if user_role == 'admin'
           @admin = User.new(user_role)
         else
           @developer = User.new
         end
  if reg_type == 'API'
    create_user(user)
  else
    @home_page.menu.register.click
    register_user(user)
  end
end

Then /^I see the (admin|developer) user is registered$/ do |user_role|
  if user_role == 'admin'
    expect(get_users_mails).to include(@admin.email.to_s)
  else
    expect(get_users_mails).to include(@developer.email.to_s)
  end
end

Then /^I become logged in as (admin|developer) user$/ do |user_role|
  if user_role == 'admin'
    expect(@home_page.menu.logged_as.text).to include("Logged in as #{@admin.login}")
  else
    expect(@home_page.menu.logged_as.text).to include("Logged in as #{@developer.login}")
  end
end

When('I create a project') do
  @projects_page = ProjectsPage.new
  @projects_page.load
  expect(page).to have_current_path('/redmine/projects')

  @project = Project.new
  @projects_page.create_project(@project)
  expect(page).to have_content('Successful creation.')
end

Then /^I see that project is created on (UI|API) level$/ do |level|
  if level == 'UI'
    expect(@projects_page).to have_current_path("/redmine/projects/#{@project.identifier}/settings")
    expect(@projects_page.page_header).to have_content(@project.name.to_s)
  else
    expect(get_existing_projects_names).to include(@project.name.to_s)
  end
end

When /^I add (admin|developer) user as a member of the project$/ do |user_role|
  find('#tab-members').click
  find('.icon-add').click
  within('#ajax-modal') do
    check @developer.first_name
    check 'Developer'
    find('#member-add-submit').click
  end
end

Then /^I can can see (admin|developer) user in the project member list$/ do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  within(find('a', text: user.first_name.to_s).find(:xpath, '../..')) do
    if user_role == 'admin'
      expect(page).to have_content('Manager')
    else
      expect(page).to have_content('Developer')
    end
  end
end

When('I create an issue and assign {string} user to created issue') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I see the issue is created') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I see {string} user is assigned to the issue') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I logout') do
  find('.logout').click
end

When('I login as {string} user') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I track time for the assigned issue') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I see the time is tracked properly') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I close the issue') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I see the issue was closed') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I close the project') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I see it was successfully closed') do
  pending # Write code here that turns the phrase above into concrete actions
end

And('I debug') do
  binding.pry
end
