# Sidecar

<p align="left">
  <img src="https://raw.githubusercontent.com/mikeastock/sidecar/master/logo.png" alt="logo" title="logo" width="100" height="100">
</p>

[![CircleCI](https://circleci.com/gh/mikeastock/sidecar/tree/master.svg?style=svg)](https://circleci.com/gh/mikeastock/sidecar/tree/master)
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

A Slack bot that creates channels for side conversations

Have you ever needed to take a conversation in a Slack channel to a new channel?
Are people in a large channel less than happy about your side conversation?
Well you should give Sidecar a spin, the idea is that this bot will create a new
channel and invite users all in one fell swoop so you can continue your conversation
and leave other members of the channel happy.

### Setup

Deploy to Heroku

To configure there needs to be a Slack API Key environment variable set.

```bash
heroku config:set SLACK_TOKEN="some-token"
```
