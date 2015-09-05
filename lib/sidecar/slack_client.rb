require "httparty"

module Sidecar
  class SlackClient
    BASE_URL = "https://slack.com"

    def self.create_channel(name)
      body = {
        name: name,
        token: ENV["SLACK_TOKEN"]
      }

      HTTParty.post(BASE_URL + "/api/channels.create", body: body)
    end

    def self.post_message(message:)
      body = {
        username: "RandomKellieTweets",
        channel: ENV["SLACK_CHANNEL"],
        text: message,
        token: ENV["SLACK_TOKEN"]
      }

      HTTParty.post("https://slack.com/api/chat.postMessage", body: body)
    end
  end
end
