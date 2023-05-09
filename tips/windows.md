# Windows Tips

## desktop icons

```shell
## save as a .reg file

Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
"lconSpacing"="-1125"
"IconVerticalSpacing"="-1125"

```

## 快速休眠

- 创建一个快捷方式
- 输入`rundll32 powrprof.dll,SetSuspendState`，点击下一步
- 输入快捷键，我选的是`Ctrl+F12`
- 点击确定即可

