require 'github/client'

class Event < ActiveRecord::Base
  belongs_to :actor
  attr_accessible :data, :github_created_at, :type, :checksum, :actor
  # was getting a mass-assignment error until I added the attr_accessible above
  # seems this was added in Rails 3.2.3 which the screencast pre-dates

  def self.create_from_record actor, record
    create_params = {
      :type              => record['type'],
      :actor             => actor,
      :data              => [Marshal.dump(record)].pack('m'),
      :github_created_at => record['created_at'],
      :checksum          => record['checksum']
    }
    create create_params
  end
end
