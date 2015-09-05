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
        get("/api/users.list")
      end

      def invite_channel(user:, channel:)
        body = {
          user: user,
          channel: channel,
        }

        post("/api/channels.invite", body: body)
      end

      def post_message(message:)
        body = {
          username: "RandomKellieTweets",
          channel: ENV["SLACK_CHANNEL"],
          text: message,
        }

        post("/api/chat.postMessage", body: body)
      end
    end
  end
end
