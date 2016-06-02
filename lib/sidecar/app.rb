require "sinatra"
require "sidecar/slack_command"
require "sidecar/channel"

module Sidecar
  class App < Sinatra::Base
    get "/" do
      "Hello World!"
    end

    post "/slack" do
      slack_command = SlackCommand.new(params[:text])
      channel = Channel.find_or_create(slack_command.channel_name)
      slack_command.users.each do |user|
        Sidecar::SlackClient.invite_channel(user: user.id, channel: channel.id)
      end
    end
  end
end
