# hubot-nicoencode

This is for personal / experimental release.

Be careful of copyrights.
We don't take responsibility for any damage. 

The language is Japanese, change them if you need (Maybe easy for do that). 

Botの言語は日本語です。
自分用にカスタマイズしてますので適宜変更してご利用ください。

著作権には十分に留意して利用してください。
このソフトウェアを生じて発生したいかなる損害にも、その責任を負いません。
あくまで実験および検証用のリリースである旨をご理解ください。


## Requirements

CentOS 6系（本番）、OSX（開発）で動作を確認しています。

* ffmpeg > 2.2
* curl > 7.4
* ruby > 2.2

## Install

Edit your external-scripts.json

```json
[
  "hubot-nicoencode"
]
```

Clone into the node_modules directory.

```
$ cd ~/path/to/your-hubot/node_modules
$ git clone https://github.com/kaminogi/hubot-nicoencode
$ cd hubot-nicoencode
$ npm install
```
Set the envs.

```
$ export ACCESS_URL=http://localhost:8080/
$ export NICOVIDEO_DUMP_EMAIL=***
$ export NICOVIDEO_DUMP_PASSWORD=***
```

## Usage

```
hubot mp3 http://www.nicovideo.jp/watch/sm25113423s
```

## Contributing

* Fork me on GitHub
