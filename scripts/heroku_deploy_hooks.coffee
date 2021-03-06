# Description:
#   Notifies build status on heroku by Heroku Deploy Hooks
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# URLS:
#   POST /heroku/deploy_hooks
#
# Author:
#   succi0303
#

module.exports = (robot) ->
  robot.router.post "/heroku/deploy_hooks", (req, res) ->
    envelope = { room: '#general' }

    robot.send envelope, """
    Herokuからデプロイの通知が届きました。
    '#{req.body.app}' was deployed by #{req.body.user}
    Release: #{req.body.release}, Head: #{req.body.head}, Run at: #{req.body.url}
    """
    res.send "ok"
