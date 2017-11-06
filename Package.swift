// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "DGFrameworkTemplate",
    products: [
        .library(name: "DGFrameworkTemplate", targets: ["DGFrameworkTemplate"])
    ],
    targets: [
        .target(name: "DGFrameworkTemplate"),
        .testTarget(
            name: "DGFrameworkTemplateTests",
            dependencies: [
                "DGFrameworkTemplate"
            ]
        )
    ]
)
