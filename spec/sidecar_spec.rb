require_relative "spec_helper"
require_relative "../sidecar.rb"

def app
  Sidecar
end

describe Sidecar do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
