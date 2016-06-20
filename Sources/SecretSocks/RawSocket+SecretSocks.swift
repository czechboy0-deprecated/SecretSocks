import SSL
import SocksCore

extension RawSocket {
    /**
        Creates a new SSL Context and Secure Socket.

        - parameter mode: Client or Server
        - parameter certificates: SSL Certificates for the Server, use .none for Client
    */
    public func makeSecret(
        mode: SSL.Mode = .client,
        certificates: SSL.Certificates = .none
    ) throws -> SSL.Socket {
        let context = try SSL.Context(
            mode: mode,
            certificates: certificates
        )

        return try SSL.Socket(
            context: context,
            descriptor: descriptor
        )
    }

    /**
        Creates a Secure Socket from the SSL Context provided.
    */
    public func makeSecret(context: SSL.Context) throws -> SSL.Socket {
        return try SSL.Socket(
            context: context,
            descriptor: descriptor
        )
    }
}
