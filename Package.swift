// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SQLCipherPackage",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SQLCipherPackage",
            targets: ["SQLCipherPackage"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SQLCipherPackage",
            dependencies: [],
            cSettings: [
                .define("SQLITE_HAS_CODEC", to: "1"),
                .define("SQLITE_TEMP_STORE", to: "3"),
                .define("SQLCIPHER_CRYPTO_CC", to: nil),
                .define("NODEBUG", to: "1"),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("Security"),
            ]),
        .testTarget(
            name: "SQLCipherPackageTests",
            dependencies: ["SQLCipherPackage"]
        ),
    ]
)
