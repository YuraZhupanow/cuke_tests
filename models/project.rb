# frozen_string_literal: true

require 'ffaker'

class Project
  attr_reader :name, :identifier
  attr_accessor :id

  def initialize
    @name = FFaker::Company.name
    @identifier = generate_id
    @id = id
  end

  def generate_id
    rand(32**8).to_s(32)
  end
end
