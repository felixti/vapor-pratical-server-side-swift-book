// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "myProject",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor", from: "4.85.1"),
        .package(url: "https://github.com/vapor/fluent", from: "4.8.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.6.0"),
        .package(url: "https://github.com/BinaryBirds/swift-html", from: "1.7.0")
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "SwiftHtml", package: "swift-html"),
                .product(name: "SwiftSvg", package: "swift-html"),
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),

            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            .product(name: "Vapor", package: "vapor"),
        ])
    ]
)
