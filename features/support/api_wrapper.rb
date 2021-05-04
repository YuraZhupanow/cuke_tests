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

    puts @user.login

    # save_user @user
    #save_user(@user)
    #parse_body(response)
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
  end

  def fetch_projects
    response = RestClient.get "#{ENV['ROOT_URL']}/projects.json", admin_json_api_header
    raise 'Projects were not fetched' unless response.code == 200

    puts @project.name
    parse_body(response)

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
