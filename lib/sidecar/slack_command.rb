require "sidecar/user"

module Sidecar
  class SlackCommand
    attr_reader :channel_name, :usernames

    def initialize(text)
      @channel_name, *@usernames = text.split(" ")
    end

    def users
      SlackClient.
        list_users["members"].
        map { |user| User.new(user["id"], user["name"]) }.
        select { |user| usernames.include?(user.name) }
    end
  end
end
