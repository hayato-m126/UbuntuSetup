# デバイスが扱えない
LANなどがOSから正しく認識されない

# 解決策
Hardware Enablementカーネルを導入する

```
# Ubuntu 16.04の場合
sudo apt -y install --install-recommends linux-generic-hwe-16.04
```
