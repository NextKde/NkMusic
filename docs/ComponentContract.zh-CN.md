# KMusic 共享组件规范（2026-10-28 同步）

[English](ComponentContract.md)

本文件覆盖旧 Design / DesignReset 中与组件尺寸、设置行、浮层和提示气泡冲突的约定。音乐信息架构、52px 播放器、98% 侧栏和方角外窗保留既有产品约定。

## 来源与更新方式

- 规范来源：`nextkdeAppDemo` 的 AGENTS.md，以及 Settings、Tooltips、Dialogs、Popovers、GalleryDesign 文档。
- 组件快照由 `tools/vendor_components.py` 导入，完整 SHA 和逐文件哈希在 `vendor/nextkdeAppDemo/vendor-manifest.json`。
- 本轮快照 `e0652bb5abc03da263a5b3fa9040c3e19667270d` 基于上游 `54fd5f14a5bc50132d524d053b373b1dc1189935`，包含用户本地尚未提交的最新浮层组件。它是本地评审快照，并非已发布或已合并的上游版本。
- 未修改上游分支或索引；未合并 main、提交 PR 或推送。正式发布前按仓库流程评审并固定可从上游获取的提交。
- 禁止手改 vendor 的组件视觉。通用修复提交上游后重新导入；应用包装仅负责状态、采样来源和组件组合。

## 必须保持的规则

| 区域 | 约束 |
| --- | --- |
| 设置分组 | 使用 SettingsGroup / SettingsItem：标题 15px/700，设置名 12px/400，说明 10px 浅色；12px 分组圆角，无额外描边、阴影和前导图标 |
| 设置控件 | 右对齐；24px 布局高度；开关本体 44×20，垂直居中；长说明换行，窄宽度自动堆叠 |
| 选择器 | 三个及以上选项使用 LiquidSelect；当前值文字＋灰底上下箭头，选项普通字重、前置勾，无蓝色 active |
| 设置下拉 | 不透明浅色 #f0f0f1／深色 #303034，8px 圆角、24px 行、紧凑宽度、无边框、轻扩散阴影；这是浮层液态材质的明确例外 |
| 悬浮菜单 | LiquidPopover＋LiquidPopoverItem；一个液态面板，内部栏目为普通材质，不嵌套液态行 |
| 上下文表单 | 搜索、歌单新建／改名和歌曲详情使用 LiquidContentPopover，箭头锚定来源按钮／条目 |
| 独立模态任务 | 使用 LiquidDialog：32px G2 连续圆角，0.95 材质不透明度与染色强度独立；底下真实同窗内容先模糊再折射 |
| 弹窗操作 | LiquidDialogButton：30px 胶囊、实体材质、无额外边框；主操作使用 Demo 固定蓝色＋白字，禁用为中性色 |
| Tooltip | KosToolTip：0.7 材质、14px 圆角、11px 普通字重、10×5 内边距；不重复完整导航文字 |
| 状态 | 同类控件正常／hover／按下／焦点／禁用保持同一轮廓；液态控件不得额外添加强调色边框；保留键盘与无障碍行为 |
| 采样 | 仅采样同一窗口中的真实内容，排除浮层自身；不使用 KWin 插件，不以壁纸冒充背景；降低透明度和不可采样时采用不透明回退 |

## 应用接入

- `MusicDialog` / `MusicContentPopover`：将 appCanvas 作为采样来源；共享组件负责轮廓、材质和箭头。
- `MusicActionButton`：使用 KosToolTip，业务按钮保留原操作与可访问名称。
- `MusicSelect`：使用统一设置下拉规格；选择仍由 activated 信号交给应用保存。
- `MusicSettingsSwitch`：仅组合 Demo 例子的 44×20 本体与 24px 布局槽，开关实现不复制。
- `SettingsPage`：直接消费共享分组与设置行；不再保留自定义 Heading / SettingRow。

编译、交互、截图和测试只在虚拟机执行。证据保存在忽略的 `.task/demo-sync/`，不自动发布截图。功能测试通过不代表用户已经确认视觉验收。
