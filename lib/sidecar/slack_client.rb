require "httparty"

module Sidecar
  class SlackClient
    include HTTParty
    base_uri = "https://slack.com"

    class << self
      def create_channel(name)
        body = {
          name: name,
          token: ENV["SLACK_TOKEN"]
        }

        post("/api/channels.create", body: body)
      end

      def list_channels
        body = {
          token: ENV["SLACK_TOKEN"]
        }

        post("/api/channels.list", body: body)
      end

      def list_users

      end

      def post_message(message:)
        body = {
          username: "RandomKellieTweets",
          channel: ENV["SLACK_CHANNEL"],
          text: message,
          token: ENV["SLACK_TOKEN"]
        }

        post("/api/chat.postMessage", body: body)
      end
    end
  end
end
