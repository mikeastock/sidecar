# Sidecar

<p align="left">
  <img src="https://raw.githubusercontent.com/mikeastock/sidecar/master/logo.png" alt="logo" title="logo" width="100" height="100">
</p>

[![CircleCI](https://circleci.com/gh/mikeastock/sidecar/tree/master.svg?style=svg)](https://circleci.com/gh/mikeastock/sidecar/tree/master)

A Slack bot that creates channels for side conversations

Have you ever needed to take a conversation in a Slack channel to a new channel?

Are people in a large channel less than happy about your side conversation?

Well you should give Sidecar a spin, the idea is that this bot will create a new
channel and invite users all in one fell swoop so you can continue your conversation
and leave other members of the channel happy.

## Getting Started
1. Create a new [bot integration](https://my.slack.com/services/new/bot)
2. Follow the steps to deploy the bot to Heroku or run it locally
3. Once the bot is running, start a new channel with `@<your-bot-name> new-channel-name @people @to @invite`

#### One-Click Heroku
Click this button:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

#### Manual Heroku
1. Install [Heroku toolbelt](https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up)
2. Create a new bot integration (as above)
3. `heroku create`
4. `heroku config:set SLACK_TOKEN=[Your API token]`
5. `git push heroku master`

#### To Run Locally
1. Create a `.env` file and paste `SLACK_TOKEN=[Your API Token]`
1. `bundle install`
1. `bundle exec rackup`

## Directions
* To start a new channel, `@<your-bot-name> new-channel-name @people @to @invite`
