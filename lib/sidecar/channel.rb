require "sidecar/slack_client"

module Sidecar
  class Channel
    def initialize(json)
      @json = json
      require "pry"; binding.pry
    end

    def self.create(name)
      new(
        Sidecar::SlackClient.create_channel(name)
      )
    end

    private

    attr_reader :json
  end
end
