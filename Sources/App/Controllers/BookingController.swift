//
//  BookingController.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/20/19.
//


import Vapor
import FluentSQLite

final class BookingController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Booking]> {
        return Booking.query(on: req).all()
    }
    
    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<BookingResponse> {
        return try req.content.decode(CreateBooking.self).flatMap { bookingRequest in
            guard let userID = bookingRequest.user_id else {
                throw Abort(.notFound, reason: "User ID is missing")
            }
            guard let productID = bookingRequest.product_id else {
                throw Abort(.notFound, reason: "Product ID is missing")
            }
            guard let count = bookingRequest.count else {
                throw Abort(.notFound, reason: "Product count is missing")
            }
            return Product.find(productID, on: req).flatMap(to: BookingResponse.self, { (prod) in
                guard prod != nil else {
                    throw Abort(.notFound, reason: "Could not find product.")
                }
                let userResult = User.find(userID, on: req).flatMap(to: BookingResponse.self, { (user) in
                    guard user != nil else {
                        throw Abort(.notFound, reason: "Could not find user.")
                    }
                    let newBooking = Booking(user_id: userID, product_id: productID, count: count)
                    return newBooking.save(on: req).map(to: BookingResponse.self, { (savedBooking) in
                        var response = BookingResponse()
                        response.id = savedBooking.id
                        response.user = user
                        response.product = prod
                        response.count = count
                        return response
                    })
                })
                return userResult
            })
        }
    }
    
    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Booking.self).flatMap { booking in
            return booking.delete(on: req)
            }.transform(to: .ok)
    }
}
