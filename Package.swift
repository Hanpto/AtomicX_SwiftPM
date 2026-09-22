// swift-tools-version:6.0
import PackageDescription

// 依赖版本取各仓库当前最新 tag（2026-09-22 查得）。
// Tencent-RTC 三个仓库的 product 名和包名不一致，别按包名猜：
//   TUICore_SwiftPM        → product "TUICore"
//   Professional_SwiftPM   → product "TXLiteAVSDK_Professional"
//   Chat_SDK_SwiftPM       → product "Chat_SDK_SwiftPM"
let package = Package(
    name: "AtomicX",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AtomicX", targets: ["AtomicX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Hanpto/AtomicXCore_SwiftPM.git",
                 from: "4.3.8"),
        .package(url: "https://github.com/Hanpto/RTCRoomEngine_SwiftPM.git",
                 from: "4.3.5"),
        .package(url: "https://github.com/Tencent-RTC/TUICore_SwiftPM.git",
                 from: "8.6.7020"),
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git",
                 from: "13.3.20845"),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git",
                 from: "9.0.7652"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "6.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.12.0"),
    ],
    targets: [
        .target(
            name: "AtomicX",
            dependencies: [
                .product(name: "AtomicXCore", package: "AtomicXCore_SwiftPM"),
                .product(name: "RTCRoomEngine", package: "RTCRoomEngine_SwiftPM"),
                .product(name: "TUICore", package: "TUICore_SwiftPM"),
                .product(name: "TXLiteAVSDK_Professional",
                         package: "Professional_SwiftPM"),
                .product(name: "Chat_SDK_SwiftPM", package: "Chat_SDK_SwiftPM"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Kingfisher", package: "Kingfisher"),
            ],
            path: "Sources",
            // 和 podspec 的 exclude_files 保持一致
            exclude: ["AlbumPicker"],
            resources: [.process("Resources")]
        ),
    ]
)
