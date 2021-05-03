# frozen_string_literal: true

require 'rest-client'

# module contains api requests to manage users
module ApiWrapper
  def create_user
    @user = User.new

    response = RestClient.post "#{ENV['ROOT_URL']}/users.json",
                               {
                                 "user": {
                                   "login": @user.login,
                                   "firstname": @user.first_name,
                                   "lastname": @user.last_name,
                                   "mail": @user.email,
                                   "password": @user.password
                                 }
                               }.to_json,
                               admin_json_api_header

    raise 'User was not created' unless response.code == 201

    # save_user @user
    save_user(@user)
    @generated_user = JSON.parse(response.body)
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

  def admin_json_api_header
    { content_type: :json, 'x-redmine-api-key': ENV['ADMIN_API_KEY'] }
  end
end

World(ApiWrapper)
