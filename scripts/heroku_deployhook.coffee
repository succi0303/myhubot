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
    payload = JSON.parse req.body.payload
    envelope = { room: '#general' }

    robot.send envelope, """
    [Heroku deployhook]
    app       : #{payload.app}
    user      : #{payload.user}
    url       : #{payload.url}
    head      : #{payload.head}
    head_long : #{payload.head_long}
    git_log   : #{payload.git_log}
    release   : #{payload.release}
    """
