require 'github/client'

class Actor < ActiveRecord::Base
  has_many :events

  # Apparently the leading :: in front of Github::Client
  # specifies global scope. Without it ruby would look within the current scope
  # i.e. Model::Actor::Github::Client in this case
  def self.import name, klass = ::Github::Client
    records = klass.fetch 'maikeru'

    records.each do |record|
      actor = Actor.find_or_create_by_name 'maikeru'
      event = Event.create_from_record actor, record
    end
  end
end
