# ElyraOS Frameworks Base

This repository keeps Android `frameworks/base` close to the LineageOS/AOSP
base while adding the minimal ElyraOS identity hooks needed during early
bring-up.

## Scope

`frameworks/base` is shared by core framework APIs, SystemUI, system services,
resource loading, and SettingsProvider integration. ElyraOS changes here should
stay small until the first booting build is available.

## Current ElyraOS Additions

- `android.os.Build` exposes hidden ElyraOS version fields backed by
  `ro.elyra.version` and `ro.elyra.display.version`.
- LineageOS SDK package names, permissions, and framework resources are kept for
  compatibility with the current vendor layer.
- The compatibility policy identifies which Lineage references are still
  expected during early bring-up.
- A validation helper checks ElyraOS hooks and expected Lineage
  compatibility references.

## Compatibility Policy

Do not rename these aggressively yet:

- `lineage-sdk`
- `org.lineageos.*`
- `lineageos.*`
- `LineageSettingsProvider`
- `LineageParts`
- `org.lineageos.platform`

They are still part of the early ElyraOS compatibility layer. Rename them only
after ElyraParts and Elyra SDK are ready across the full source tree.
