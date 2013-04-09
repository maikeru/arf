require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  def test_import
    records = Github::Client.fetch 'maikeru'

    assert_difference 'Actor.count', 1 do
      assert_difference 'Event.count', records.length do
        Actor.import 'maikeru', Github::Client
      end
    end
  end

  def test_double_import
    records = Github::Client.fetch 'maikeru'

    assert_difference 'Actor.count', 1 do
      assert_difference 'Event.count', records.length do
        Actor.import 'maikeru', Github::Client
      end
    end

    assert_difference 'Actor.count', 0 do
      assert_difference 'Event.count', 0 do
        Actor.import 'maikeru', Github::Client
      end
    end
  end
end
