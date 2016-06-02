require "sidecar/slack_client"

module Sidecar
  class Channel
    attr_reader :id, :name

    def initialize(json)
      @id = json.fetch("id")
      @name = json.fetch("name")
    end

    def self.find_or_create(name)
      create_response = Sidecar::SlackClient.create_channel(name)
      channel = if create_response["ok"]
                  create_response["channel"]
                else
                  find(name)
                end

      new(channel)
    end

    def self.find(name)
      Sidecar::SlackClient.list_channels["channels"].detect do |channel|
        channel["name"] == name
      end
    end
  end
end
