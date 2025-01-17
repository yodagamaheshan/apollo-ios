// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Codegen",
    platforms: [
        .macOS(.v10_13)
    ],
    dependencies: [
        .package(name: "Apollo", path: ".."),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.3.0"),
        .package(url: "https://github.com/eneko/SourceDocs.git", .upToNextMinor(from: "1.2.0"))
    ],
    targets: [
        .target(name: "Codegen",
                dependencies: [
                    .product(name: "ApolloCodegenLib", package: "Apollo"),
                    .product(name: "ArgumentParser", package: "swift-argument-parser"),
                ]),
        .target(name: "SchemaDownload",
                dependencies: [
                    .product(name: "ApolloCodegenLib", package: "Apollo"),
                ]),
        .target(name: "DocumentationGenerator",
                dependencies: [
                    .product(name: "ApolloCodegenLib", package: "Apollo"),
                    .product(name: "SourceDocsLib", package: "SourceDocs"),
                ]),
        .testTarget(name: "CodegenTests",
                    dependencies: [
                        "Codegen"
                    ]),
    ]
)
