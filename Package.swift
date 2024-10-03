// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDKDatasenses",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SDKDatasenses",
            targets: ["SDKDatasenses"]
        )
    ],
    dependencies: [
//        .package(url: "https://github.com/datasenses/datasenses-ios", .upToNextMinor(from: "0.3.3")),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", "10.24.0" ..< "11.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SDKDatasenses",
            dependencies: [
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                "Datasenses_iOS",
            ]
        ),
        .binaryTarget(
            name: "Datasenses_iOS",
            path: "Datasenses_iOS.xcframework"
        ),
        .testTarget(
            name: "ONDatasensesTests",
            dependencies: ["SDKDatasenses"]
        )
    ]
)
