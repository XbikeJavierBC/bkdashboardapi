// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "bkdashboardapi",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "bkdashboardapi",
            targets: [
                "bkdashboardapi"
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/XbikeJavierBC/bksdkcore.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "bkdashboardapi",
            dependencies: [
                "bksdkcore"
            ]
        ),
        .testTarget(
            name: "bkdashboardapiTests",
            dependencies: [
                "bkdashboardapi"
            ]
        ),
    ]
)
