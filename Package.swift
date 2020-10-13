// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewAnimatePreset",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UIViewAnimatePreset",
            targets: ["UIViewAnimatePreset"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UIViewAnimatePreset",
            path: "Sources"),
        .testTarget(
            name: "UIViewAnimatePresetTests",
            dependencies: ["UIViewAnimatePreset"],
            path: "Tests")
    ]
)
