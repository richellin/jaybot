# Description:
#   Notification of the study meeting.

cronJob = require('cron').CronJob
module.exports = (robot) ->
  new cronJob('0 40 13 * * *', () =>
    envelope = room: process.env.HUBOT_CHATWORK_ROOMS
    robot.send envelope, "jabot Test"
  ).start()
