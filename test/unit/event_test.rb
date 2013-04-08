require 'test_helper'
require 'github/client'

class EventTest < ActiveSupport::TestCase
  def test_import
    records = Github::Client.fetch 'maikeru'

    assert_difference 'Event.count', records.length do
      records.each do |record|
        actor = Actor.find_or_create_by_name 'maikeru'
        event = Event.create_from_record actor, record
      end
    end
  end
end
