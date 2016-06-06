require "spec_helper"

module Sidecar
  RSpec.describe SlackCommand do
    describe "#users" do
      it "return users from Slack command" do
        slack_users = [
          {
            "id" => 1,
            "name" => "@mikeastock",
          },
          {
            "id" => 2,
            "name" => "@gedward",
          },
        ]

        response = { "members" => slack_users }

        expect(SlackClient).to receive(:list_users).and_return(response)

        command = SlackCommand.new("new-channel @mikeastock")

        expect(command.users).to eq([User.new(1, "@mikeastock")])
      end
    end
  end
end
