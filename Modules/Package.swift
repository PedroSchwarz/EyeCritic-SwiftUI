// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Modules",
            targets: [
                "Core-Providers",
                "Core-Resources",
                "Home-Feature",
                "Movies-Feature",
                // Services
                "Movies-Feature-Repository-Live"
            ]
        ),
        .library(
            name: "Modules-Watch",
            targets: [
                "Core-Providers",
                "Core-Resources",
                "Movies-Feature",
                // Services
                "Movies-Feature-Repository-Live"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.6.4")
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            .upToNextMajor(from: "7.0.0")
        ),
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.3"
        )
    ],
    targets: [
        .target(
            name: "Core-Providers",
            dependencies: [
                "Alamofire",
                "Core-Resources",
                "Swinject"
            ]
        ),
        .testTarget(
            name: "Core-Providers-Tests",
            dependencies: ["Core-Providers"]
        ),
        .target(
            name: "Core-Resources",
            dependencies: [
                "Swinject"
            ]
        ),
        .testTarget(
            name: "Core-Resources-Tests",
            dependencies: ["Core-Providers"]
        ),
        .target(
            name: "Home-Feature",
            dependencies: [
                "Core-Resources",
                "Movies-Feature"
            ]
        ),
        .testTarget(
            name: "Home-Feature-Tests",
            dependencies: ["Home-Feature"]
        ),
        .target(
            name: "Movies-Feature",
            dependencies: [
                "Core-Resources",
                "Movies-Feature-Repository",
                "Kingfisher"
            ]
        ),
        .target(
            name: "Movies-Feature-Repository",
            dependencies: [
                "Core-Resources"
            ]
        ),
        .target(
            name: "Movies-Feature-Repository-Live",
            dependencies: [
                "Movies-Feature-Repository",
                "Core-Providers"
            ]
        ),
    ]
)
