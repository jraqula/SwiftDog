// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftDog",
    dependencies: [
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", "3.0.0" ..< "4.0.0"),
    ],
    targets: [
        .target(
            name: "SwiftDog",
            dependencies: ["KeychainAccess"])
    ]
)
