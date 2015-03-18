# Description:
#   リマインダー

CronJob = require('cron').CronJob

module.exports = (robot) ->
  new CronJob
    cronTime: '0 30 6 * * 1-5'
    onTick: ->
      robot.send { room: '#general' }, '@succi0303: おはよー！起きて！'
    start: true

module.exports = (robot) ->
  new CronJob
    cronTime: '0 0 8 * * 0,6'
    onTick: ->
      robot.send { room: '#general' }, '@succi0303: おはよー！起きて!'
