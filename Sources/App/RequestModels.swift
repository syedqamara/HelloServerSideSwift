//
//  RequestModels.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/20/19.
//
import Vapor

struct LoginRequest: Content {
    var email: String?
    var password: String?
}
struct BookingRequest: Content {
    var booking_id: Int?
    var user_id: Int?
}

struct CreateBooking: Content {
    var product_id: Int?
    var user_id: Int?
    var count: Int?
}
