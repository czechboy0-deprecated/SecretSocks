import TLS
import SocksCore

extension RawSocket {
    /**
        Creates a new SSL Context and Secure Socket.

        - parameter mode: Client or Server
        - parameter certificates: SSL Certificates for the Server, use .none for Client
    */
    public func makeSecret(
        mode: TLS.Mode = .client,
        certificates: TLS.Certificates = .none
    ) throws -> TLS.Socket {
        let context = try TLS.Context(
            mode: mode,
            certificates: certificates
        )

        return try TLS.Socket(
            context: context,
            descriptor: descriptor
        )
    }

    /**
        Creates a Secure Socket from the SSL Context provided.
    */
    public func makeSecret(context: TLS.Context) throws -> TLS.Socket {
        return try TLS.Socket(
            context: context,
            descriptor: descriptor
        )
    }
}
