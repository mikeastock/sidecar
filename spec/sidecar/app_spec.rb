require "spec_helper"
require "rack/test"
require "sidecar/app"

module Sidecar
  RSpec.describe App do
    include Rack::Test::Methods

    describe "POST /slack" do
      it do
        expect(SlackCommand).to receive(:new).with("new-channel").and_return(spy)
        expect(Channel).to receive(:find_or_create).and_return(spy)

        post "/slack", text: "new-channel"

        expect(last_response).to be_ok
      end
    end

    def app
      Sidecar::App
    end
  end
end
