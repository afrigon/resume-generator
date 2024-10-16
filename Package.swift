// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "resume",
    platforms: [
        .macOS(.v15)
    ],
    targets: [
        // UI in a target that supports Previews
        .target(
            name: "ResumeCore",
            path: "Sources/Core",
            resources: [
                .copy("Data/afrigon.json"),
                .process("Data/github-mark.png")
            ]
        ),
        
        .executableTarget(
            name: "resume",
            dependencies: [
                "ResumeCore",
            ],
            path: "Sources/Renderer"
        )
    ]
)
