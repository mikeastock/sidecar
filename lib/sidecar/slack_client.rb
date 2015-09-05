require "httparty"

module Sidecar
  class SlackClient
    include HTTParty
    base_uri "https://slack.com"
    default_params token: ENV["SLACK_TOKEN"]

    class << self
      def create_channel(name)
        body = {
          name: name,
        }

        post("/api/channels.create", body: body)
      end

      def list_channels
        get("/api/channels.list")
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
