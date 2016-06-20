import PackageDescription

let package = Package(
    name: "SecretSocks",
    dependencies: [
    	.Package(url: "https://github.com/czechboy0/Socks.git", majorVersion: 0, minor: 7),
    	.Package(url: "https://github.com/Zewo/COpenSSL", majorVersion: 0, minor: 6)
    ]
)
