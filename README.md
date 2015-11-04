# できること

バッテリー残量をgrowlで通知します。
30%以下で電源が刺さっていない場合、80%以上で電源が刺さっている場合に通知します。

以下のコマンドで直接実行できます。
`ruby notice.rb`

# 定期的に実行

CronまたはLaunchdを設定し、定期的に実行するようにすると便利です。

## cronを利用する場合

```
# crontab -e
```

```
*/5 * * * * /ruby/directory/.rbenv/version/ruby /path/to/battery/notice.rb 2>> /path/to/battery/error_log.log
```

## launchdを利用する場合

```
$ cd ~/Library/LaunchAgents/
$ vim notice_battery.plist
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
    <string>notice_battery</string>
  <key>ProgramArguments</key>
    <array>
      <string>/usr/bin/ruby</string>
      <string>/var/www/battery/notice.rb</string>
    </array>
  <key>StartInterval</key>
    <integer>36</integer>
  <key>RunAtLoad</key>
    <true/>
  <key>ExitTimeout</key>
    <integer>300</integer>
</dict>
</plist>
```

* launchd listに登録する場合
```
$ launch load ~/Library/LaunchAgents/notice_battery.plist
```

* launchd listから外す場合
```
$ launch unload ~/Library/LaunchAgents/notice_battery.plist
```
