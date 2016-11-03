# Description:
#   リマインダー

CronJob = require('cron').CronJob
random = require('hubot').Response::random

envelope = { room: '#general' }
username = 'succi0303'
timezone = 'Asia/Tokyo'

module.exports = (robot) ->
  # midday
  new CronJob
    cronTime: '0 0 12 * * *'
    onTick: ->
      nowDate = new Date()
      nowYear = nowDate.getYear()
      nowMonth = nowDate.getMonth() + 1
      nowDay = nowDate.getDate()
      dateStr = "#{nowYear}年#{nowMonth}月#{nowDate}日"
      robot.send envelope, "#{dateStr}の正午です。"
    start: true
    timeZone: timezone
