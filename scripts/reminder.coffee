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
    '朝ですよー！',
    '求めに応じ、后土皇地祇の御名にて推参！',
    '求めに応じ、祝融の名に来臨！',
    '求めに応じ、蓐収の名にて参上！',
    '求めに応じ、禺彊の名にて登場！',
    '求めに応じ、句芒の名にて見参！',
    '玉皇上帝の威光と、天地五行の理で、絶体結界を解く。封印よ、消し飛べ！解封呪！',
    '天の陽気よ、地の陰気よ、我に集まりて力となれ！天封呪！'
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

  goodnight_greets = [
    'おやすみなさい。',
    '今日も一日お疲れさまでした。',
    'あんまり夜更かししないでくださいね。',
    'もうそろそろ寝ましょう。',
    '眠いよー。'
  ]

  # good night
  new CronJob
    cronTime: '*/30 0 23 * * *'
    onTick: ->
      robot.send envelope, "@#{username}: " + random(goodnight_greets)
    start: true
    timeZone: timezone
