require "sidecar/slack_client"

module Sidecar
  class Channel
    attr_reader :id, :name

    def initialize(json)
      @id = json["id"]
      @name = json["name"]
    end

    def self.find_or_create(name)
      create = Sidecar::SlackClient.create_channel(name)
      channel = if create["ok"]
                  create
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
