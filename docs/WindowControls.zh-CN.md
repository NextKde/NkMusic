# KWin 协作窗控

[English](WindowControls.md)

交通灯由 KWin 在确认接管后绘制。MusicWindowControls 仅适配固定版本的
Kos.Ui：上报实际按钮位置，保留不透明的协议目标，只隐藏并禁用内部自绘按钮。
没有此协议的桌面继续使用可操作的客户端窗控，不改动已记录哈希的共享组件。

原生安装需要在 QML 导入路径提供匹配的 Kos.SurfaceShape 模块。Flatpak
必须针对自己的 Qt SDK 构建并携带该模块，不能从沙箱读取宿主插件。此仓库
目前没有发布 Music Flatpak，本次原生验证不代表 Flatpak 已就绪。

在隔离、断网的虚拟机配置中使用 KMUSIC_REVIEW_DIR，提交
`{"action":"windowControls"}`，应返回 platformReady=true、
compositorActive=true、clientOpacity=0、clientEnabled=false。

Ubuntu 26.04 / Qt 6.10.2 虚拟机已通过上述真实 KWin 接管检查与窗控回归；
应用内容与合成器截图已在本地对照检查，没有发布截图。此结果仅涵盖本次窗控，
不代表整个音乐应用的视觉验收。
