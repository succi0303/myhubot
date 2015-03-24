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
    Build \##{payload.number} #{payload.status_message} for #{payload.repository.owner_name}/#{payload.repository.name}:#{payload.branch} by #{payload.author_name}
    Type: #{payload.type}, Build URL: #{payload.build_url}
    Message: #{payload.message}, Commit: #{payload.compare_url}
    """
    res.send 'ok'
