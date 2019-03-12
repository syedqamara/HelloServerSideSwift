//
//  ResponseModel.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/21/19.
//

import Vapor
import FluentSQLite

final class BookingResponse: Content {
    var message: String
    var success: Bool
    var data: [BookingM]
    init(value: Bool = false) {
        success = value
        data = []
        message = ""
    }
}

final class BookingM: SQLiteModel {
    var id: Int?
    var user: User?
    var product: Product?
    var count: Int?
    init() {
        id = nil
        user = nil
        product = nil
        count = nil
    }
}

/// Allows `Todo` to be encoded to and decoded from HTTP messages.

/// Allows `Todo` to be used as a dynamic parameter in route definitions.

extension BookingM: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension BookingM: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension BookingM: Parameter { }
