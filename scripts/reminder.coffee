# Description:
#   リマインダー

CronJob = require('cron').CronJob
random = require('hubot').Response::random

envelope = { room: '#general' }
username = 'succi0303'
timezone = 'Asia/Tokyo'

module.exports = (robot) ->
  wakeup_greets = [
    'おはようございます！起きてください！',
    '起きて起きて起きてーーーー！',
    '今日も一日頑張りましょう。',
    '朝ですよー！'
  ]

  # wake up on weekdays
  new CronJob
    cronTime: '*/20 30 6 * * 1-5'
    onTick: ->
      robot.send envelope, "@#{username}: " + random(wakeup_greets)
    start: true
    timeZone: timezone

  # wake up on holidays
  new CronJob
    cronTime: '*/20 0 8 * * 0,6'
    onTick: ->
      robot.send envelope, "@#{username}: " + random(wakeup_greets)
    start: true
    timeZone: timezone
