# frozen_string_literal: true

require 'yaml'

# this module is responsible for actions that can be performed with user
module UserHelper
  CREDS_PATH = 'data/creds.yml'

  def save_user(user)
    File.open(CREDS_PATH, 'w') { |file| file.write(user.to_yaml) }
  end

  def read_user
    YAML.load_file(CREDS_PATH)
  end

  def register_user
    @user = User.new

    @registration_page = RegistrationPage.new

    @registration_page.user_login.set @user.login
    @registration_page.user_password.set @user.password
    @registration_page.user_password_confirmation.set @user.password
    @registration_page.user_firstname.set @user.first_name
    @registration_page.user_lastname.set @user.last_name
    @registration_page.user_mail.set @user.email

    @registration_page.submit_button.click

    save_user @user
  end

  def login_user(credentials)
    @login_page = LoginPage.new

    @login_page.user_login.set credentials.login
    @login_page.user_password.set credentials.password
    @login_page.login_button.click
  end
end

World(UserHelper)
