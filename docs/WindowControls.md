# Cooperative window controls

KWin owns traffic lights after `Kos.SurfaceShape.WindowControlSlot` acknowledges
takeover. MusicWindowControls adapts the pinned Kos.Ui snapshot without changing
its source: it advertises the actual delegate positions and hides/disables only
the fallback child. Unsupported desktops retain functioning controls.

Native packages need the matching NextKde protocol module on the QML import path.
Flatpak packages must build that module against their own Qt runtime; host QML
plugins cannot be loaded across the sandbox. No Music Flatpak release exists yet.

Use an isolated offline VM profile and `KMUSIC_REVIEW_DIR` request
`{"action":"windowControls"}` to inspect module loading and compositor takeover.
Expected with KWin: platformReady=true, compositorActive=true, clientOpacity=0,
clientEnabled=false. Capture both the compositor and application content.
