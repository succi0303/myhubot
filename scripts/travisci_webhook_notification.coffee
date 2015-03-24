# Description:
#   Notifies build status on Travis CI by Travis CI Webhook notification
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# URLS:
#   POST /travisci/webhook_notification
#
# Author:
#   succi0303
#

module.exports = (robot) ->
  robot.router.post "/travisci/webhook_notification", (req, res) ->
    envelope = { room: '#general' }

    robot.send envelope, 'hi'
    res.send 'ok'
