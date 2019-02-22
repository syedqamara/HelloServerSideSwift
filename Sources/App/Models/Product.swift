//
//  Product.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/20/19.
//
import FluentSQLite
import Vapor
final class Product: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    
    /// A title describing what this `Todo` entails.
    var name: String
    var image_url: String
    var description: String
    var price: Double?
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, image_url: String, description: String, price: Double) {
        self.id = id
        self.name = name
        self.image_url = image_url
        self.description = description
        self.price = price
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Product: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Product: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Product: Parameter { }

extension Product {
    var bookings: Children<Product, Booking> {
        return children(\.product_id)
    }
}
