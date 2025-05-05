// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SQLCipher",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SQLCipher",
            targets: ["SQLCipher"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SQLCipher",
            cSettings: [
                .define("SQLITE_HAS_CODEC", to: "1"),
                .define("SQLCIPHER_CRYPTO_CC", to: nil),
                .define("SQLITE_TEMP_STORE", to: "2"),
                .define("SQLITE_THREADSAFE", to: "1"),
                .define("SQLITE_ENABLE_FTS5", to: nil),
                .define("SQLITE_EXTRA_INIT", to: "sqlcipher_extra_init"),
                .define("SQLITE_EXTRA_SHUTDOWN", to: "sqlcipher_extra_shutdown"),
                .define("NDEBUG", to: nil)
            ]
        ),
        .testTarget(
            name: "SQLCipherTests",
            dependencies: ["SQLCipher"]
        ),
    ]
)
