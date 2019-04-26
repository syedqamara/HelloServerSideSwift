import FluentSQLite
import Vapor
import FluentPostgreSQL
import Authentication

enum UserType: String {
    case admin = "admin"
    case qa = "qa"
    case dev = "dev"
    case devOPS = "devOPS"
    case management = "management"
    case unknown = ""
}

/// A single entry of a User list.
final class User: PostgreSQLModel {
    /// The unique identifier for this `User`.
    var id: Int?

    /// A title describing what this `User` entails.
    var name: String
    var email: String
    var password: String
    var user_identifier: String
    var image_url: String
    
    /// Creates a new `User`.
    init(id: Int? = nil, name: String, email: String, password: String, u_id: String, img: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.user_identifier = u_id
        self.image_url = img
    }
}

/// Allows `User` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `User` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `User` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

extension User {
    var bookings: Children<User, Booking> {
        return children(\.user_id)
    }
    var type: UserType {
        if let t = UserType(rawValue: self.user_identifier) {
            return t
        }
        return .unknown
    }
}

final class AuthUser: Content {
    var email: String
    var passwordHash: String
}

extension User: PasswordAuthenticatable {
    
    /// See `PasswordAuthenticatable`.
    static var usernameKey: WritableKeyPath<User, String> {
        return \.email
    }
    
    /// See `PasswordAuthenticatable`.
    static var passwordKey: WritableKeyPath<User, String> {
        return \.password
    }
}
