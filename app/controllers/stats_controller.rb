require 'github/client'
class StatsController < ApplicationController
  def index
  end

  def for_user
    @events = Github::Client.fetch params[:id]
    @type_count = Hash.new
    @events.each do |event|
      #@type_count[event['type']] = 1
      @type_count[event['type']] = @type_count[event['type']].to_i + 1
    end
  end
end
