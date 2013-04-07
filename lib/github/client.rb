require 'open-uri'
require 'json'

module Github
  class Client
    def self.fetch username
      # Not sure exactly why we do this instead of just using class methods all the way.
      # I suspect that it makes overriding 'get' easier in tests
      new.fetch username
    end

    def fetch username
      JSON.parse get username
    end

    private
    def get username
      # screencast said to expect problems using open-uri in production (something about lots of exceptions to handle)
      # and so eventually would switch to using Net::Http
      # TODO Look into open-uri and Net::Http. Pros and Cons of each
      open("https://github.com/#{username}.json").read
    end

  end
end
