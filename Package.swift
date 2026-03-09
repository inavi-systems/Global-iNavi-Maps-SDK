// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iNaviGlobalMapSDK",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "iNaviGlobalMapSDK",
            targets: ["iNaviGlobalMapSDK",
                      "iNaviGlobalMapWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/maplibre/maplibre-gl-native-distribution", from: "6.22.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "iNaviGlobalMapSDK",
            path: "xcframework/iNaviGlobalMapSDK.xcframework"
        ),
        .target(
            name: "iNaviGlobalMapWrapper",
            dependencies: [
                .target(name: "iNaviGlobalMapSDK"),
                .product(name: "MapLibre", package: "maplibre-gl-native-distribution")
            ],
            path: "./Sources"
        )
    ]
)
