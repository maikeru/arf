class Event < ActiveRecord::Base
  belongs_to :actor
  attr_accessible :data, :github_created_at, :type
end
