exec    = require('child_process').exec

querystring = require('querystring')
fs = require('fs')
path = require('path')

randomStr = ->
  str = "abcdefghijklmnopqrstuvwxyz"
  (str[Math.floor(Math.random() * str.length)] for index in [1..10]).join ""


module.exports = (robot) ->
  robot.respond /.*(sm\d+)/, (msg) ->
    videoUrl = "http://www.nicovideo.jp/watch/#{msg.match[1]}"
    fileName = "#{randomStr()}.mp3"

    msg.send "了解。 #{videoUrl} のエンコードを始める。少し時間がかかる。"
    exec_path = path.join(__dirname, "../bin/nicovideo-dump")
    save_dir  = path.join(__dirname, "../files")

    cmd = "#{exec_path} #{videoUrl} | ffmpeg -i pipe:0 -ab 192k #{save_dir}/#{fileName}"
    exec cmd, (error, stdout, stderr) ->
      console.log('stdout: ' + stdout)
      console.log('stderr: ' + stderr)
      msg.send ":star2: #{msg.match[1]} のエンコードが終わった。 \n#{process.env.ACCESS_URL}encoded/temp.mp3?id=#{fileName}"

  robot.respond /king/i, (msg) ->
    msg.send "KONG"

  # get via HTTP
  robot.router.get "/encoded/temp.mp3", (req, res) ->
    query = querystring.parse(req._parsedUrl.query)
    tmp = path.join(__dirname, '..', 'files',query.id)
    fs.exists tmp, (exists) ->
      if exists
        fs.readFile tmp,(err,data) ->
          res.writeHead(200, {'Content-Type': 'audio/mpeg'})
          res.end(data);
      else
        res.status(404).send('Not found')
