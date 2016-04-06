require 'test_helper'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  after { Capybara.reset_sessions! }
end

# Support transaction fixtures. Single connection.
class ActiveRecord::Base
  def self.connection
    @@shared_connection ||= retrieve_connection
  end
end
