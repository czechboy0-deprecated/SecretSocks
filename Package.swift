import PackageDescription

let package = Package(
    name: "SecretSocks",
    dependencies: [
    	.Package(url: "https://github.com/czechboy0/Socks.git", majorVersion: 0, minor: 8),
    	.Package(url: "https://github.com/qutheory/ssl.git", majorVersion: 0, minor: 1),
    ],
    targets: [
        Target(name: "SecretSocks")
    ]
)
