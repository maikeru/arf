require 'minitest/autorun'
require 'github/client'

module Github
  class ClientTest < MiniTest::Unit::TestCase
    def test_maikeru
      tc = self
      sample = File.read 'test/assets/maikeru.json'
      klass = Class.new(Client) do
        # define_method makes this a closure whereas def would not.
        # This allows us to access our test case class (in tc) to call the assert
        define_method(:get) do |username|
          # guess this is useful to make sure the mock isn't being called from the wrong place?
          tc.assert_equal 'maikeru', username
          sample
        end
      end
      events = klass.fetch 'maikeru'
      assert_operator events.length, :>, 0
    end
  end
end
