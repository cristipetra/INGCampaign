// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "INGCampaignNetworking",
    platforms: [.iOS(.v17), .macOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "INGCampaignNetworking",
            targets: ["INGCampaignNetworking"]
        ),
    ],
    dependencies: [
        .package(path: "../INGCampaignModels")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "INGCampaignNetworking",
            dependencies: [
                .product(name: "INGCampaignModels", package: "INGCampaignModels")
            ]
        ),
        .testTarget(
            name: "INGCampaignNetworkingTests",
            dependencies: ["INGCampaignNetworking"]
        ),
    ]
)
