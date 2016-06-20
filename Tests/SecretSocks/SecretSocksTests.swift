import XCTest

import SocksCore
@testable import SecretSocks

class SecretSocksTests: XCTestCase {
    static var allTests = [
        ("testSecureSocket", testSecureSocket)
    ]

    func testSecureSocket() {
        let host = "api.spotify.com"
        let port = UInt16(443)
        let address = InternetAddress(hostname: host, port: port)

        do {
            let socket = try TCPInternetSocket(address: address)
            try socket.connect()

            let secureSocket = try socket.makeSecret()
            try secureSocket.connect()

            let uri = "/v1/search?type=artist&q=hannah%20diamond"
            try secureSocket.send("GET \(uri) HTTP/1.1\r\nHost: api.spotify.com\r\n\r\n".bytes)
            let response = try secureSocket.receive(max: 2048).string

            XCTAssert(response.contains("spotify:artist:3sXErEOw7EmO6Sj7EgjHdU"))
        } catch {
            XCTFail("Could not make secure socket: \(error)")
        }
    }
}

extension Sequence where Iterator.Element == UInt8 {
    /**
        Converts a slice of bytes to
        string. Courtesy of Socks by @Czechboy0
    */
    public var string: String {
        var utf = UTF8()
        var gen = makeIterator()
        var str = String()
        while true {
            switch utf.decode(&gen) {
            case .emptyInput:
                return str
            case .error:
                break
            case .scalarValue(let unicodeScalar):
                str.append(unicodeScalar)
            }
        }
    }
}

extension String {
    var bytes: [UInt8] {
        return Array(utf8)
    }
}
