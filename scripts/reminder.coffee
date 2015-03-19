# Description:
#   リマインダー

CronJob = require('cron').CronJob

module.exports = (robot) ->
  wakeup_weekday = new CronJob
    cronTime: '0 52 16 * * 1-5'
    onTick: ->
      robot.send { room: '#general' }, '@succi0303: おはよございます！起きてください！'
    timeZone: 'Asia/Tokyo'
  wakeup_weekday.start()

module.exports = (robot) ->
  wakeup_holiday = new CronJob
    cronTime: '0 53 16 * * 1-5'
    onTick: ->
      robot.send { room: '#general' }, '@succi0303: テステス'
    timeZone: 'Asia/Tokyo'
  wakeup_holiday.start()
