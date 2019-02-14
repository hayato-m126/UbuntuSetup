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

# ログ
## fix-broken出来ない
```
hyt@ros-bionic:~$ sudo apt --fix-broken install
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています
状態情報を読み取っています... 完了
依存関係を解決しています ... 完了
以下の追加パッケージがインストールされます:
  python-rospkg-modules
以下のパッケージが新たにインストールされます:
  python-rospkg-modules
アップグレード: 0 個、新規インストール: 1 個、削除: 0 個、保留: 37 個。
730 個のパッケージが完全にインストールまたは削除されていません。
23.4 kB 中 0 B のアーカイブを取得する必要があります。
この操作後に追加で 133 kB のディスク容量が消費されます。
続行しますか? [Y/n] y
(データベースを読み込んでいます ... 現在 316458 個のファイルとディレクトリがインストールされています。)
.../python-rospkg-modules_1.1.7-1_all.deb を展開する準備をしています ...
python-rospkg-modules (1.1.7-1) を展開しています...
dpkg: アーカイブ /var/cache/apt/archives/python-rospkg-modules_1.1.7-1_all.deb の処理中にエラーが発生しました (--unpack):
 '/usr/lib/python2.7/dist-packages/rospkg/manifest.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
処理中にエラーが発生しました:
 /var/cache/apt/archives/python-rospkg-modules_1.1.7-1_all.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

## dpkgで強制上書きする
```
hyt@ros-bionic:~$ sudo dpkg -i --force-overwrite  /var/cache/apt/archives/python-rospkg-modules_1.1.7-1_all.deb
(データベースを読み込んでいます ... 現在 316458 個のファイルとディレクトリがインストールされています。)
.../python-rospkg-modules_1.1.7-1_all.deb を展開する準備をしています ...
python-rospkg-modules (1.1.7-1) を展開しています...
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/manifest.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/__init__.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/environment.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/stack.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/common.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/distro.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/rospack.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 警告: --force が有効なので、問題を無視します:
dpkg: 警告: '/usr/lib/python2.7/dist-packages/rospkg/os_detect.py' を上書きしようとしています。これはパッケージ python-rospkg 1.1.4-1 にも存在します
dpkg: 依存関係の問題により python-rospkg-modules の設定ができません:
 python-rospkg-modules は以下に依存 (depends) します: python-catkin-pkg ...しかし:
  パッケージ python-catkin-pkg はまだ設定されていません。

dpkg: パッケージ python-rospkg-modules の処理中にエラーが発生しました (--install):
 依存関係の問題 - 設定を見送ります
処理中にエラーが発生しました:
 python-rospkg-modules
```

