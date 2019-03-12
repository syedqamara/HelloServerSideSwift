import FluentSQLite
import Vapor
import FluentPostgreSQL

/// A single entry of a Todo list.
final class User: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var name: String
    var email: String
    var password: String

    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, email: String, password: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

extension User {
    var bookings: Children<User, Booking> {
        return children(\.user_id)
    }
}
