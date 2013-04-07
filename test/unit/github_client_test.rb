require 'minitest/autorun'
require 'github/client'

module Github
  class ClientTest < MiniTest::Unit::TestCase
    attr_reader :sample_json

    def setup
      @sample_json = File.read 'test/assets/maikeru.json'
    end

    def test_maikeru
      tc = self
      sample = sample_json
      klass = Class.new(Client) do
        # define_method makes this a closure whereas def would not.
        # This allows us to access our test case class (in tc) to call the assert
        define_method(:get) do |username|
          # guess this is useful to make sure the mock isn't being called from the wrong place?
          tc.assert_equal 'maikeru', username
          # This was originally a call to sample_json (the accessor) but was failing as the accessor is
          # on ClientTest, not on this mock class
          sample
        end
      end
      events = klass.fetch 'maikeru'
      assert_operator events.length, :>, 0
    end

    def test_checksum
      tc = self
      sample = sample_json
      klass = Class.new(Client) do
        define_method(:get) do |username|
          sample
        end
      end
      events = klass.fetch 'maikeru'
      assert events.first['checksum'], 'needs checksum'

      checksums = events.map { |e| e['checksum'] }
      assert_equal events.length, checksums.uniq.length
    end
  end
end
