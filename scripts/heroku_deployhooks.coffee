# Description:
#   Notifies build status from Heroku Deploy Hooks
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

    robot.send envelope, """
    [Heroku Deploy Hooks]
    #{req.body.user} deployed #{req.body.app}
    Release: #{req.body.release}, Head: #{req.body.head}
    open at #{req.body.url}
    """
    res.send "ok"
