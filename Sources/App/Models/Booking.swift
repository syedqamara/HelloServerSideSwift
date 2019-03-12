//
//  Booking.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/20/19.
//
import FluentSQLite
import Vapor
import FluentPostgreSQL



final class Booking: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    
    /// A title describing what this `Todo` entails.
    var user_id: User.ID
    var product_id: Product.ID
    var count: Int
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, user_id: User.ID, product_id: Product.ID, count: Int) {
        self.id = id
        self.user_id = user_id
        self.product_id = product_id
        self.count = count
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Booking: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Booking: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Booking: Parameter { }

extension Booking {
    var user: Parent<Booking, User> {
        return parent(\.user_id)
    }
    var product: Parent<Booking, Product> {
        return parent(\.product_id)
    }
}
