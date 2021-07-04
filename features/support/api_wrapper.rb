# frozen_string_literal: true

require 'rest-client'

# module contains api requests to manage users
module ApiWrapper
  def create_user(user)
    @user = user || User.new
    response = RestClient.post "#{ENV['ROOT_URL']}/users.json",
                               {
                                 "user": {
                                   "login": @user.login,
                                   "firstname": @user.first_name,
                                   "lastname": @user.last_name,
                                   "mail": @user.email,
                                   "password": @user.password,
                                   "admin": @user.role == 'admin'
                                 }
                               }.to_json,
                               admin_json_api_header

    raise 'User was not created' unless response.code == 201

    created_user = parse_body(response)
    @user.id = created_user['user']['id']
    puts @user.login

    # save_user @user
    # save_user(@user)
    # parse_body(response)
  end

  def fetch_users
    response = RestClient.get "#{ENV['ROOT_URL']}/users.json", admin_json_api_header
    raise 'Projects were not fetched' unless response.code == 200

    parse_body(response)
  end

  def create_project
    @project = Project.new
    response = RestClient.post "#{ENV['ROOT_URL']}/projects.json",
                               {
                                 "project": {
                                   "name": @project.name,
                                   "identifier": @project.identifier
                                 }
                               }.to_json,
                               admin_json_api_header

    raise 'Project was not created' unless response.code == 201

    created_project = parse_body(response)
    @project.id = created_project['project']['id']
  end

  def fetch_projects
    response = RestClient.get "#{ENV['ROOT_URL']}/projects.json", admin_json_api_header
    raise 'Projects were not fetched' unless response.code == 200

    puts @project.name
    parse_body(response)
  end

  def create_issue(user)
    response = RestClient.post "#{ENV['ROOT_URL']}/issues.json",
                               {
                                 "issue": {
                                   "project_id": @project.id,
                                   "subject": "#{@project.name}_issue",
                                   "priority_id": rand(5),
                                   "tracker_id": rand(3),
                                   "status_id": 1,
                                   "assigned_to_id": user.id
                                 }
                               }.to_json,
                               admin_json_api_header

    raise 'Issue was not created' unless response.code == 201

    created_issue = parse_body(response)
    @issue_id = created_issue['issue']['id']
  end

  def fetch_issue(issue_id)
    response = RestClient.get "#{ENV['ROOT_URL']}/issues/#{issue_id}.json", admin_json_api_header
    raise 'Issue was not fetched' unless response.code == 200
  end

  def admin_json_api_header
    { content_type: :json, 'x-redmine-api-key': ENV['ADMIN_API_KEY'] }
  end

  # may add additional parameters in future
  def parse_body(response)
    JSON.parse(response.body)
  end
end

World(ApiWrapper)
