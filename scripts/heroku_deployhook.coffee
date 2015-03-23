# Description:
#   Notify build status from Heroku deployhook
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# URLS:
#   POST /heroku_deployhook
#
# Author:
#   succi0303
#

module.exports = (robot) ->
  robot.router.post "/heroku_deployhook", (req, res) ->
    envelope = { room: '#general' }
    robot.send envelope, 'ok'
