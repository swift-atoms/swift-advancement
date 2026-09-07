// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-advancement",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Advancement", targets: ["Advancement"]),

        .library(name: "Advancement Foundation Integration", targets: ["Advancement Foundation Integration"]),
        .library(name: "Advancement Test Support", targets: ["Advancement Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-addition.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Advancement",
            dependencies: [
                .product(name: "Addition", package: "swift-addition"),
            ],
            path: "Sources/Advancement"
        ),
        
        .target(
            name: "Advancement Foundation Integration",
            dependencies: [
                .target(name: "Advancement"),
            ],
            path: "Sources/Advancement Foundation Integration"
        ),
        .target(
            name: "Advancement Test Support",
            dependencies: [
                .target(name: "Advancement"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Advancement Tests",
            dependencies: [
                .target(name: "Advancement"),
                .product(name: "Addition", package: "swift-addition"),
                .target(name: "Advancement Test Support"),
                .target(name: "Advancement Foundation Integration"),
            ],
            path: "Tests/Advancement Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
