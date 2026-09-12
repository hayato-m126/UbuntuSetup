# Raspberry Pi

RPi 5のtips

## 温度とファン

50度以上にならないとFANは回転しない

```shell
# 温度を調べる
sudo vcgencmd measure_temp

# 強制的にファンを回す
echo 255 | sudo tee /sys/class/hwmon/hwmon*/pwm1
```

## raspi-config

ubuntu 26.04だと表示されない項目があった。設定できる項目が違うことがある。
