require "sidecar/slack_client"

module Sidecar
  class Channel
    attr_reader :id, :name

    def initialize(json)
      @id = json["id"]
      @name = json["name"]
    end

    def self.create(name)
      new_channel = Sidecar::SlackClient.create_channel(name)
      channel = if new_channel["ok"]
                  new_channel
                else
                  list_channels = Sidecar::SlackClient.list_channels
                  list_channels["channels"].detect do |existing_channel|
                    existing_channel["name"] == name
                  end
                end

      new(channel)
    end
  end
end
