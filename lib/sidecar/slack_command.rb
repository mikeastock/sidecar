module Sidecar
  class SlackCommand
    def initialize(text)
      @input = text.split(" ")
    end

    def channel_name
      input.fetch(0)
    end

    private

    attr_reader :input
  end
end
