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
    payload = JSON.parse req.body.payload

    robot.send envelope, """
    Travis CIからビルドの通知が届きました。
    Build #{payload.number} for #{payload.repository.owner_name}/#{payload.repository.name} #{payload.status_message}
    """
    res.send 'ok'
