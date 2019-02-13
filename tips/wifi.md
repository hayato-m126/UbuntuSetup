# Wifi接続が頻繁に切れる
DELL XPS 15においてwifi接続が頻繁に切れる問題があった。

# 解決策
/etc/NetworkManager/NetworkManager.confを以下のように書き換える

```
[ifupdown]
managed=true
```

参考
http://tech.junkpot.net/archives/734
