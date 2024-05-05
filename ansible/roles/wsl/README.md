# WSL Setup

WSLでubuntuの日本語環境を作る。
wslgでGUIアプリも動作する。

## reference

<http://cha.la.coocan.jp/wp/2023/11/25/post-866/>

## TIPS

vscodeはWindows側に入れて、WSLのプラグイン入れておけばおｋ
wsl側にいれると以下のように出る。

```shell
hyt@DESKTOP-NSL7IRJ:~$ code .
To use Visual Studio Code with the Windows Subsystem for Linux, please install Visual Studio Code in Windows and uninstall the Linux version in WSL. You can then use the `code` command in a WSL terminal just as you would in a normal command prompt.
Do you want to continue anyway? [y/N] y
To no longer see this prompt, start Visual Studio Code with the environment variable DONT_PROMPT_WSL_INSTALL defined.
```
