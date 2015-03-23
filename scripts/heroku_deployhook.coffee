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

    robot.send envelope, """
    [Heroku deployhook]
    app       : #{req.body.app}
    user      : #{req.body.user}
    url       : #{req.body.url}
    head      : #{req.body.head}
    head_long : #{req.body.head_long}
    git_log   : #{req.body.git_log}
    release   : #{req.body.release}
    """
    res.send "ok"
