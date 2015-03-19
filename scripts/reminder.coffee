# Description:
#   リマインダー

CronJob = require('cron').CronJob

module.exports = (robot) ->
  new CronJob
    cronTime: '0 47 16 * * 1-5'
    onTick: ->
      robot.send { room: '#general' }, '@succi0303: おはよございます！起きてください！'
    start: true
    timeZone: 'Asia/Tokyo'

module.exports = (robot) ->
  new CronJob
    cronTime: '0 46 16 * * 1-5'
    onTick: ->
      robot.send { room: '#general' }, '@succi0303: テステス'
    start: true
    timeZone: 'Asia/Tokyo'
