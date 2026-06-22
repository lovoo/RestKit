// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "RestKit",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
    ],
    products: [
        .library(
            name: "RestKit",
            targets: ["RestKit"]
        ),
    ],
    targets: [
        .target(
            name: "RestKit",
            dependencies: [
                "ISO8601DateFormatterValueTransformer",
                "RKValueTransformers",
                "SOCKit",
                "TransitionKit",
            ],
            path: ".",
            exclude: [
                ".git",
                "Docs",
                "Examples",
                "Resources",
                "RestKit.xcodeproj",
                "RestKit.xcworkspace",
                "Tests",
                "Vendor",
                "Gemfile",
                "Gemfile.lock",
                "Podfile",
                "Podfile.lock",
                "Rakefile",
                "RestKit.podspec",
                "VERSION",
                "Code/module.modulemap",
                "Code/Search/README.md",
            ],
            sources: [
                "Code",
            ],
            publicHeadersPath: "Code",
            cSettings: [
                .headerSearchPath("Code/Support"),
                .headerSearchPath("Code/ObjectMapping"),
                .headerSearchPath("Code/Network"),
                .headerSearchPath("Code/Network/AFNetworking"),
                .headerSearchPath("Code/CoreData"),
                .headerSearchPath("Code/Search"),
                .headerSearchPath("Code/Testing"),
                .headerSearchPath("Code/CocoaLumberjack"),
                .headerSearchPath("Vendor/RKValueTransformers"),
            ],
            linkerSettings: [
                .linkedFramework("CFNetwork", .when(platforms: [.iOS])),
                .linkedFramework("CoreData"),
                .linkedFramework("CoreServices", .when(platforms: [.macOS])),
                .linkedFramework("MobileCoreServices", .when(platforms: [.iOS])),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
            ]
        ),
        .target(
            name: "ISO8601DateFormatterValueTransformer",
            dependencies: ["RKValueTransformers"],
            path: "Vendor/ISO8601DateFormatterValueTransformer/Code",
            publicHeadersPath: "."
        ),
        .target(
            name: "RKValueTransformers",
            path: "Vendor/RKValueTransformers",
            sources: [
                "Code",
            ],
            publicHeadersPath: "."
        ),
        .target(
            name: "SOCKit",
            path: "Vendor/SOCKit",
            publicHeadersPath: ".",
            cSettings: [
                .unsafeFlags(["-fno-objc-arc"]),
            ]
        ),
        .target(
            name: "TransitionKit",
            path: "Vendor/TransitionKit/Code",
            publicHeadersPath: "."
        ),
    ]
)
