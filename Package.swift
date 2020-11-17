// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "localisation-helper",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "localisation-helper",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")],
            path: "Sources/localisation-helper",
            resources: [
                .process("dictionary.json")
        ]),
        .target(
            name: "Run",
            dependencies: ["localisation-helper"],
            path: "Sources/Run"
        ),
        .testTarget(
            name: "localisation-helperTests",
            dependencies: ["localisation-helper"]),
    ]
)
