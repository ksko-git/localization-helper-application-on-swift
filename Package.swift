// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "localization-helper",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/vapor/leaf", .exact("4.0.0"))
    ],
    targets: [
        .target(
            name: "LHLibrary",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Vapor", package: "vapor"),                
                .product(name: "Leaf", package: "leaf")
            ],
            path: "Sources/LHLibrary",
            resources: [
                .process("Dictionary/dictionary.json"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .target(
            name: "RunTerminal",
            dependencies: [
                .target(name: "LHLibrary")
            ],
            path: "Sources/RunTerminal"
        ),
        .target(
            name: "RunAPI",
            dependencies: [
                .target(name: "LHLibrary")
            ],
            path: "Sources/RunAPI"
        ),
        .target(
            name: "RunWeb",
            dependencies: [
                .target(name: "LHLibrary")
            ],
            path: "Sources/RunWeb",
            resources: [
                .copy("Sources/LHLibrary/Resources")
            ]            
        ),
        .testTarget(name: "LHLibraryTests", dependencies: [
            .target(name: "LHLibrary"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
