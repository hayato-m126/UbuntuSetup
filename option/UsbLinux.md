# UsbLinux
USBメモリにBIOS,UEFI両方でブートできるUbuntu環境を作る。

## 環境
- BIOSでブートするPC, もしくはUSBマウント出来る仮想環境
- 高速USBメモリ、SanDisk Extreme Pro USB3.1など

## 参考URL
- http://bellbind.tumblr.com/post/45757405213/usb-hdd%E3%81%ABmbrefi%E4%B8%A1%E3%83%96%E3%83%BC%E3%83%88%E5%8F%AF%E8%83%BD%E3%81%AAubuntu%E3%82%A4%E3%83%A1%E3%83%BC%E3%82%B8%E3%82%92%E4%BD%9C%E3%82%8B%E6%96%B9%E6%B3%95

- http://takuya-1st.hatenablog.jp/entry/20110311/1299821823

## 作業手順
1. BIOSでブートさせる
2. パーティションの作成
    - 第1パーティションがFAT32で50MくらいEFI用
    - 第2パーティションがLinuxの/
3. Ubuntuのインストール
4. EFI用のパーティションのUUIDを確認する(GPartedで簡単に確認できる)
5. EFIブートローダーインストール
6. fstabでUFIのパーティションを自動マウントする

5,6はUsbLinux.shで処理出来る

## fstab編集方法
EFIパーティションのUUIDを調べて、/etc/fstabに記載し自動マウント設定する
UUID=xxxx-xxxx   /boot/efi  vfat    defaults    0   1
