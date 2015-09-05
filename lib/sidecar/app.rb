require "sidecar/channel"

module Sidecar
  class App < Sinatra::Base
    get "/" do
      "Hello World!"
    end

    post "/slack" do
      require "pry"; binding.pry
      Channel.create(name)
    end
  end
end
