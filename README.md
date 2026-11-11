# LumiPluginHydrationReminder

📖 English | [中文版](README_zh.md)

Shared remote package for the "Hydration Reminder" plugin, assembled by Lumi family sibling apps such as Lumi and Wakey.

> This plugin depends on no other plugins. The menu bar, settings, docs, and storage are all accessed through Provider contracts; the generic reminder capability is provided by `LumiKitReminder`.

## Package

- Manifest package name: `LumiPluginHydrationReminder` (matches the repository name)
- Product / Target: `PluginHydrationReminder`
- Platform: macOS 14+
- Swift tools: 6.0

## What It Provides

- Menu bar hydration reminder controls, status, and interval selection.
- Reminder interval management and custom intervals on the settings page.
- User manual contribution.
- Multi-screen hydration reminder overlay.
- Persistence of reminder running state, daily count, and custom intervals.
- Re-triggering of due reminders after system sleep/wake.

## Dependencies and Integration

```swift
dependencies: [
    .package(url: "https://github.com/lumi-softworks/LumiPluginHydrationReminder.git", from: "1.0.0")
]
```

Add the product to the host Factory target:

```swift
.product(name: "PluginHydrationReminder", package: "LumiPluginHydrationReminder")
```

And assemble it in the plugin factory:

```swift
import PluginHydrationReminder

PluginHydrationReminder()
```

The default plugin ID is `com.coffic.lumi.plugin.hydration`. Hosts can inject their own brand ID; Wakey passes the historical ID `HydrationReminderPlugin` to preserve its existing enabled state and plugin data directory:

```swift
PluginHydrationReminder(id: "HydrationReminderPlugin")
```

The host must provide `MenuBarProviding`, `SettingViewProviding`, `DocsViewProviding`, and `StorageProviding`, and use LumiUI's shared settings and button components.

## Testing

```sh
swift test
```
