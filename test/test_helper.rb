ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  module Github
    class Client < ::Github::Client
      TEST_DATA = {
        'maikeru' => File.read('test/assets/maikeru.json')
      }

      private
      def get user
        TEST_DATA[user]
      end
    end
  end

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
