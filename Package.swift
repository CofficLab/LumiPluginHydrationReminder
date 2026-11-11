// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LumiPluginHydrationReminder",
    defaultLocalization: "en",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "PluginHydrationReminder",
            targets: ["PluginHydrationReminder"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/lumi-softworks/LumiKitReminder.git", from: "1.0.0"),
        .package(url: "https://github.com/lumi-softworks/LumiLogging.git", from: "1.0.1"),
        .package(url: "https://github.com/lumi-softworks/LumiKernel.git", from: "1.1.0"),
        .package(url: "https://github.com/lumi-softworks/LumiSettings.git", from: "1.1.0"),
        .package(url: "https://github.com/lumi-softworks/LumiUI.git", from: "1.12.0"),
        .package(url: "https://github.com/lumi-softworks/LumiProviders.git", from: "1.20.0")
    ],
    targets: [
        .target(
            name: "PluginHydrationReminder",
            dependencies: [
                .product(name: "KitReminder", package: "LumiKitReminder"),
                .product(name: "LumiLoggingKit", package: "LumiLogging"),
                .product(name: "KernelCore", package: "LumiKernel"),
                .product(name: "ProviderSettingView", package: "LumiSettings"),
                .product(name: "LumiUI", package: "LumiUI"),
                .product(name: "ProviderDocsView", package: "LumiProviders"),
                .product(name: "ProviderMenuBar", package: "LumiProviders"),
                .product(name: "ProviderStorage", package: "LumiProviders")
            ],
            path: "Sources/PluginHydrationReminder",
            resources: [.process("../../Resources/HydrationReminder.xcstrings")]
        ),
        .testTarget(
            name: "PluginHydrationReminderTests",
            dependencies: [
                "PluginHydrationReminder",
                .product(name: "KernelCore", package: "LumiKernel"),
                .product(name: "ProviderSettingView", package: "LumiSettings"),
                .product(name: "ProviderDocsView", package: "LumiProviders"),
                .product(name: "ProviderMenuBar", package: "LumiProviders")
            ],
            path: "Tests/PluginHydrationReminderTests"
        )
    ]
)
