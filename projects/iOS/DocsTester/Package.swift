// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "DocsTester",
    products: [
        .library(
            name: "DocsTester",
            targets: ["DocsTester"]),
    ],
    dependencies: [
        .package(url: "https://github.com/revenuecat/purchases-ios", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "DocsTester",
            dependencies: [
                .product(name: "RevenueCat", package: "purchases-ios"),
            ])
    ]
)
