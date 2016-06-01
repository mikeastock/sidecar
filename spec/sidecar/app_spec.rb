require "spec_helper"
require "rack/test"
require "sidecar/app"

module Sidecar
  RSpec.describe App do
    include Rack::Test::Methods

    describe "POST /slack" do
      it do
        post "/slack"

        expect(last_response).to be_ok
      end
    end

    def app
      Sidecar::App
    end
  end
end
