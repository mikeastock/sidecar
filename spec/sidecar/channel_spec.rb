require "spec_helper"

module Sidecar
  RSpec.describe Channel do
    describe ".find_or_create" do
      context "channel does not exist" do
        it "returns new channel" do
          channel_id = 1
          channel_name = "demo-channel"

          create_response = {
            "ok" => true,
            "channel" => {
              "id" => channel_id,
              "name" => channel_name,
            },
          }

          expect(SlackClient).
            to receive(:create_channel).
            with(channel_name).
            and_return(create_response)

          channel = Channel.find_or_create(channel_name)

          expect(channel.id).to eq(channel_id)
          expect(channel.name).to eq(channel_name)
        end
      end

      context "channel already exists" do
        it "returns existing channel" do
          channel_id = 1
          channel_name = "demo-channel"

          create_response = { "ok" => false }
          existing_channel = {
            "id" => channel_id,
            "name" => channel_name,
          }

          expect(SlackClient).
            to receive(:create_channel).
            with(channel_name).
            and_return(create_response)

          expect(Channel).
            to receive(:find).
            with(channel_name).
            and_return(existing_channel)

          channel = Channel.find_or_create(channel_name)

          expect(channel.id).to eq(channel_id)
          expect(channel.name).to eq(channel_name)
        end
      end
    end
  end
end
