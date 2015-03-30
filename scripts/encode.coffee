exec = require('child_process').exec

randomStr = ->
  str = "abcdefghijklmnopqrstuvwxyz"
  (str[Math.floor(Math.random() * str.length)] for index in [1..10]).join ""

module.exports = (robot) ->
  robot.respond /.*(sm\d+)/, (msg) ->
    videoUrl = "http://www.nicovideo.jp/watch/#{msg.match[1]}"
    fileName = "#{randomStr()}.mp3"

    msg.send "了解。 #{videoUrl} のエンコードを始める。"
    cmd = "bin/nicovideo-dump #{videoUrl} | ffmpeg -i pipe:0 -ab 192k tmp/#{fileName}"
    exec cmd, (error, stdout, stderr) ->
      console.log('stdout: ' + stdout)
      console.log('stderr: ' + stderr)
      msg.send ":star2: #{msg.match[1]} のエンコードが終わった。 \n#{process.env.ACCESS_URL}encoded/temp.mp3?id=#{fileName}"
