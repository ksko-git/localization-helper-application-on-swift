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
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "LHLibrary",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Vapor", package: "vapor")
            ],
            path: "Sources/LHLibrary",
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
        .testTarget(name: "LHLibraryTests", dependencies: [
            .target(name: "LHLibrary"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
