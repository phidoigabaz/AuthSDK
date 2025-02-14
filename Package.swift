// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthSDK",
    platforms: [
        .iOS(.v13), // framework hỗ trợ tối thiểu từ ios 13
        .macOS(.v10_15) // // framework hỗ trợ tối thiểu từ macos 10.15
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AuthSDK",
            targets: ["AuthSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AuthSDK",
            dependencies:
                [.product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")],
            path: "Sources/AuthSDK",
            swiftSettings: [
                .define("SWIFT_PACKAGE"),
                //.unsafeFlags(["-target", "arm64-apple-ios", "-target", "x86_64-apple-ios"])
            ]
        ),
        .testTarget(
            name: "AuthSDKTests",
            dependencies: ["AuthSDK"]
        ),
    ]
)
