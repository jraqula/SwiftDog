// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftDog",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftDog",
            targets: ["SwiftDog"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", "3.0.0" ..< "4.0.0"),
    ],
    targets: [
        .target(
            name: "SwiftDog",
            dependencies: ["KeychainAccess"]),
    ]
)
