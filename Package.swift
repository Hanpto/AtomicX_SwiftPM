// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "AtomicX",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AtomicX", targets: ["AtomicX"])
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/AtomicXCore_SwiftPM.git", from: "4.3.0"),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.0.7652"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.12.0")
    ],
    targets: [
        .target(
            name: "AtomicX",
            dependencies: [
                .product(name: "AtomicXCore", package: "AtomicXCore_SwiftPM"),
                .product(name: "Chat_SDK_SwiftPM", package: "Chat_SDK_SwiftPM"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            path: "Sources",
            exclude: ["AlbumPicker"],
            resources: [.process("Resources")]
        )
    ],
    swiftLanguageModes: [.v5]
)
