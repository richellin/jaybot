# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  robot.respond /I am (.*)/i, (msg) ->
      msg.send "Hi, #{msg.match[1]}"
  
  robot.hear /now\(\)/i, (msg) ->
      msg.send new Date()
  
  robot.respond /sh (.+)/i, (msg) ->
      file = msg.match[1].trim()
      if /(^\.|\/)/.exec(file)
        msg.send 'Error: File name must not have "/" and must not start with "."'
        return

      @exec = require('child_process').exec
      command = "sh ./scripts/sh/#{file}"
      
      @exec command, (err, stdout, stderr) ->
          resp = ""
          resp +=    err if    err?
          resp += stdout if stdout?
          resp += stderr if stderr?
          msg.send "[info][title]execute: #{command}[/title]#{resp}[/info]"