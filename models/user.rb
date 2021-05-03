# frozen_string_literal: true

require 'ffaker'

class User
  attr_reader :login, :password, :first_name, :last_name, :email

  def initialize
    @login = FFaker::Internet.user_name
    @password = FFaker::Internet.password
    @first_name = FFaker::Name.first_name
    @last_name = FFaker::Name.last_name
    @email = FFaker::Internet.email
  end
end
