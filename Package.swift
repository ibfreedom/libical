// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libical",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "libical",
            targets: ["libical"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "libical",
            path: "src",
            publicHeadersPath: "public", cSettings: [
                .define("HAVE_CONFIG_H"),
                .define("_GNU_SOURCE", .when(platforms: [Platform.linux])),
                .define("HAVE_ENDIAN_H", .when(platforms: [Platform.linux])),
                .define("HAVE_BYTESWAP_H", .when(platforms: [Platform.linux])),
                .define("PACKAGE_DATA_DIR=\"/tmp/zoneinfo\""),
                .headerSearchPath("include")
            ]),
        .testTarget(
            name: "libicalTests",
            dependencies: ["libical"]),
    ]
)
