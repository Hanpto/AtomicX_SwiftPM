// swift-tools-version:6.0
import PackageDescription

// 验证阶段（方案 A）：只声明源码真正 import 的模块。
// podspec 里还写了 TUICore / TXLiteAVSDK_Professional / RTCRoomEngine，
// 但 atomic_x/Sources 一个都没 import——那些是为了 CocoaPods 链接才声明的，
// SPM 不需要。
//
// AtomicXCore 会带出 RTCRoomEngine → TXIMSDK_Plus_SwiftPM / TRTC_Professional_SwiftPM。
// 这里显式声明 TXIMSDK_Plus_SwiftPM 是因为源码有一处 `import ImSDK_Plus`，
// 而 SPM 不允许 import 传递依赖。它和 RTCRoomEngine 用的是同一个包，
// 版本约束一致，SPM 会解析成单实例，不会链进两份 IM SDK。
//
// 正式改造（方案 B）时要换成 Tencent-RTC 官方的 Chat_SDK_SwiftPM /
// Professional_SwiftPM / TUICore_SwiftPM，并同步重建我们那四个壳仓库的依赖。
let package = Package(
    name: "AtomicX",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AtomicX", targets: ["AtomicX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Hanpto/AtomicXCore_SwiftPM.git",
                 from: "4.3.8"),
        .package(url: "https://github.com/Hanpto/TXIMSDK_Plus_SwiftPM.git",
                 from: "9.0.7667"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "6.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.12.0"),
    ],
    targets: [
        .target(
            name: "AtomicX",
            dependencies: [
                .product(name: "AtomicXCore", package: "AtomicXCore_SwiftPM"),
                .product(name: "TXIMSDK_Plus", package: "TXIMSDK_Plus_SwiftPM"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Kingfisher", package: "Kingfisher"),
            ],
            path: "Sources",
            // 与 podspec 的 exclude_files 保持一致
            exclude: ["AlbumPicker"],
            resources: [.process("Resources")]
        ),
    ]
)
