# [DEPRICATED] SecretSocks

[![Build Status](https://travis-ci.org/czechboy0/Socks.svg?branch=master)](https://travis-ci.org/czechboy0/SecretSocks)
![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20OS%20X-blue.svg)
![Package Managers](https://img.shields.io/badge/package%20managers-swiftpm-yellow.svg)

> SSL/TLS addon for [Socks](https://github.com/czechboy0/Socks).

# :warning: This project is now depricated and will not receive any further maintenance. It will be deleted at the end of 2016.

:wrench: Usage
------------
This package extends `RawSocket` from [Socks](https://github.com/czechboy0/Socks) to provide a `makeSecret()` method. 

When called, this method initializes an SSL/TLS socket to send and receive data securely.

# Installation

## Swift Package Manager

```swift
.Package(url: "https://github.com/czechboy0/SecretSocks.git", majorVersion: 0, minor: 1)
```

You also need to install the system `openssl` package, see instructions here: https://github.com/qutheory/ssl#building

# Example

Since `TCPInternetSocket` inherits from `RawSocket`, the `makeSecret()` method is available.

```swift
let address = InternetAddress(hostname: "api.spotify.com", port: 443)
let socket = try TCPInternetSocket(address: address)
try socket.connect()

let secureSocket = try socket.makeSecret()
try secureSocket.connect()

try secureSocket.send([0x00, 0x01, 0x02, ...])
let response = try secureSocket.receive(max: 2048)
```

:gift_heart: Contributing
------------
Please create an issue with a description of your problem or open a pull request with a fix.

:v: License
-------
MIT

