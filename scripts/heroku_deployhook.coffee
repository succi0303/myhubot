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

url = require('url')
querystring = require('querystring')

module.exports = (robot) ->
  robot.router.post "/heroku_deployhook", (req, res) ->
    query = querystring.parse url.parse(req.url).query
    envelope = { room: '#general' }

    robot.send envelope, """
    [Heroku deployhook]
    app       : #{query.app}
    user      : #{query.user}
    url       : #{query.url}
    head      : #{query.head}
    head_long : #{query.head_long}
    git_log   : #{query.git_log}
    release   : #{query.release}
    """
