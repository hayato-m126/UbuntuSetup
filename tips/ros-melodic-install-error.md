# ROSのインストール時に失敗する
apt-keyの登録で失敗してやりなおすと、apt --fix-broken installをやれと言われるが、python-rospkg-modulesのバージョンがおかしくfix-brokenも出来なくなった。

## 発生した状況
ネイティブブートでインストールしたときに出た。
VMで再現しようとしたら何故か起こらない。

# 対策
python-rospkg-modulesを強制上書きで更新する

```
sudo dpkg -i --force-overwrite /var/cache/apt/archives/python-rospkg-modules_1.1.7-1_all.deb
```


