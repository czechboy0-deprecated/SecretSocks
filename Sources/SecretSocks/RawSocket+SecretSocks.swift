import SSL
import SocksCore

extension RawSocket {
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

    public func makeSecret(context: SSL.Context) throws -> SSL.Socket {
        return try SSL.Socket(
            context: context,
            descriptor: descriptor
        )
    }
}
