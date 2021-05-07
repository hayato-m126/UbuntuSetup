# Virtualbox
virtualbox上に環境を作るときのtips

## Guest Additionsのインストール
デフォルトでは解像度がウインドウに合わせて変更されない。

Guest Additionsのディスクをマウントするとビルドしてインストールしようとするが、gccとmakeが入ってないと、ビルドがそもそもうまく行かない。
特にエラーとかでなくハマるので先に以下を実行しておく

```
sudo apt install gcc make
```

## ファイル共有
一般ユーザーでも共有フォルダに読み書きできるようにvboxsfにユーザーを追加しておく

```
sudo gpasswd -a $USER vboxsf
```