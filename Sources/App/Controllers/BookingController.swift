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
    func index(_ req: Request) throws -> Future<BookingResponse> {
        return try req.content.decode(BookingRequest.self).flatMap { bookingRequest in
            if let userID = bookingRequest.user_id {
                let userResult = User.find(userID, on: req).flatMap(to: BookingResponse.self, { (userObj) in
                    guard let user = userObj else {
                        let bookingObject = BookingResponse(value: false)
                        bookingObject.message = "User Not Found"
                        let obj = req.eventLoop.newSucceededFuture(result: bookingObject)
                        return obj
                    }
                    
                    let allBookings = Booking.query(on: req).all()
                    return allBookings.flatMap(to: BookingResponse.self, { (bookings) in
                            let temp = bookings.filter(){$0.user_id == userID}
                            let response = temp.map({ (booking) -> EventLoopFuture<BookingM> in
                                let prodResult = Product.query(on: req).filter(\.id == booking.product_id).first()
                                
                                let b = BookingM()
                                b.id = booking.id
                                b.count = booking.count
                                b.user = user
                                return prodResult.map({ (product) -> (BookingM) in
                                    b.product = product
                                    return b
                                })
                                
                            })
                            let obj = req.eventLoop.newSucceededFuture(result: BookingResponse(value: true))
                            let booking = response.reduce(obj, { (previous, pureBookings) -> EventLoopFuture<BookingResponse> in
                                
                                return previous.flatMap(to: BookingResponse.self, { (object) in
                                    
                                    let tempValue = pureBookings.map({ (bookingObject) -> BookingResponse in
                                        
                                        object.data.append(bookingObject)
                                        
                                        return object
                                        
                                    })
                                    
                                    return tempValue
                                    
                                })
                                
                            })
                            return booking
                    })
                })
                return userResult
            }
            let bookingObject = BookingResponse(value: false)
            bookingObject.message = "User ID is missing"
            let obj = req.eventLoop.newSucceededFuture(result: bookingObject)
            return obj
        }
        
    }
    
    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<BookingM> {
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
            return Product.find(productID, on: req).flatMap(to: BookingM.self, { (prod) in
                guard prod != nil else {
                    throw Abort(.notFound, reason: "Could not find product.")
                }
                let userResult = User.find(userID, on: req).flatMap(to: BookingM.self, { (user) in
                    guard user != nil else {
                        throw Abort(.notFound, reason: "Could not find user.")
                    }
                    let newBooking = Booking(user_id: userID, product_id: productID, count: count)
                    return newBooking.save(on: req).map(to: BookingM.self, { (savedBooking) in
                        var response = BookingM()
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
