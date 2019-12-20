# IDE_LAUNCHER

一个快速筛选文件目录并打开或唤醒 IDE 的 alfred workflow.

## Why do I write this workflow
 
使用微服务的开发模式后, 维护的 repo 数量日益增多.

而对于习惯把单个 repo 全屏显示开发的人来说, 在多个 repo 之间切换变得越来越痛苦(不停地切屏).

为了能快速在不同 repo 中切换便有了此 workflow.

## Features
1. 文件目录搜索(支持模糊匹配)
2. 根据打开文件的位置唤醒该 IDE. (以 vscode 为例, 若目录未被打开, 则启动一个新的 vscode 打开该目录. 否则当前屏幕会自动 focus 到打开过的 vscode.)
3. 支持的 IDE 和对应的 alfred keyword

| IDE name      | alfred default keyword |
| -----------   | ----------- |
| VScode      |  code |
| SublimeTxt   |  subl |
| IDEA      |  idea |
| PyCharm   |  pcm |

4. 支持自定义默认显示的文件路径(默认为 `~` 目录)


### Demonstration

![](https://upload-images.jianshu.io/upload_images/2674994-6a865c2ecd895ba5.gif?imageMogr2/auto-orient/strip)
[Click to view Interaction.](https://upload-images.jianshu.io/upload_images/2674994-6a865c2ecd895ba5.gif?imageMogr2/auto-orient/strip)


### User Manual

IDE launcher 简单实现了对文件的 `ls` 和 `cd` 操作, 唤醒 alfred 后， 输入任意 hotkey+空格 如 `code ` 则会出现文件列表(默认显示 `~` 目录, 设置默认目录[link]). 
 - 输入 数字字母 可进行**模糊匹配**
 - 使用 `tab` 键补全目录
 - 输入 `/` 可以进入下层目录 (文件夹名称需补全)
 - 输入 `../` 进入上层目录 (文件夹名称需补全)
 - 回车 或 点击 alfred 列表内容则 **唤醒相应 IDE**

## Installation

- 使用二进制 workflow 文件.
  - [Download latest release.](https://github.com/joeeeeey/ide_filter/releases)
  - Double click `WorkingFilter.alfredworkflow` to install this workflow.
  (Reinstall for update)

- 使用 github repo. 
  - Open terminal.
  - Run `cd ~/Library/Application\ Support/Alfred\ 3/Alfred.alfredpreferences/workflows/`(Alfred3) or `/Library/Application\ Support/Alfred/Alfred.alfredpreferences/workflows/`(Alfred4).
  - Git clone this repo.(`git pull origin master` for update)

### 自定义默认显示的文件路径

```bash
cat >> /usr/local/etc/ide_launcher_config.json <<EOF
{ "ide_default_path": "~/your_path" }
EOF
```

## Debug
1. go to the repo directory in termial.
2. run `make test_code`.

## TODO: 

* Support more IDEs