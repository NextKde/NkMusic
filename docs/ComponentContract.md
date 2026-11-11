# KMusic shared component contract (2026-10-28)

[简体中文](ComponentContract.zh-CN.md)

This supersedes conflicting component geometry/material guidance in Design and
DesignReset. Keep the existing music architecture, 52px player, 98% sidebar and
square outer window.

## Provenance

The authority is nextkdeAppDemo's AGENTS.md and Settings, Tooltips, Dialogs,
Popovers and GalleryDesign documents. Import only through tools/vendor_components.py;
never edit vendored visuals. The manifest records the exact SHA and file hashes.

Snapshot `e0652bb5abc03da263a5b3fa9040c3e19667270d` is a local review snapshot on
`54fd5f14a5bc50132d524d053b373b1dc1189935`, including the user's uncommitted latest
floating components. It is not a published/reviewed upstream release. No upstream
branch/index change, main merge, PR or push was made. Before publication, review
and pin an upstream-fetchable revision through the repository's PR workflow.

## Rules

- Settings use SettingsGroup / SettingsItem: 15px bold group headings, 12px normal
  names, optional 10px muted descriptions; ordinary 12px-radius groups without
  borders, shadows or leading icons. Controls align right; wrapping/stacking is
  handled by the shared row. Use 24px control slots and 44×20px switches.
- Three or more choices use LiquidSelect: value-only trigger, gray paired-chevron
  indicator, normal option weight and a leading check, without blue selection.
  Settings menus are the explicit opaque exception: #f0f0f1 light / #303034 dark,
  8px corners, 24px rows, compact width, no outline, subtle diffuse shadow.
- Action menus use LiquidPopover and ordinary LiquidPopoverItem rows. Search,
  playlist create/rename and song inspection use anchored LiquidContentPopover.
- Standalone modal tasks use LiquidDialog: 32px G2 corners, 0.95 glass opacity
  independent of tint. Sample and blur actual same-window content before refraction.
- Dialog actions use LiquidDialogButton: solid, 30px capsule, no extra outline;
  enabled primaries use Demo fixed blue and white text, disabled ones are neutral.
- Help uses KosToolTip: 0.7 glass, 14px corners, 11px normal text, 10×5px padding.
  Do not repeat complete navigation labels.
- Preserve contours in normal, hover, pressed, focused and disabled states. Never
  add an accent outline to liquid controls. Preserve keyboard/accessibility.
- Exclude overlays from sampled content; no KWin effects or wallpaper replicas.
  Respect reduced transparency and unavailable-sampling fallback.

MusicDialog and MusicContentPopover supply appCanvas as the scene; canonical
components own geometry/material. MusicActionButton supplies canonical tooltips;
MusicSelect supplies settings defaults; MusicSettingsSwitch only composes the
Demo's 44×20 control inside a 24px slot. SettingsPage uses canonical groups/rows.
All persistence and action signals remain application-owned.

Build, runtime, screenshot and test verification are VM-only. Keep evidence in
ignored .task/demo-sync/; never automatically publish screenshots. Passing
functional checks does not imply user visual acceptance.
