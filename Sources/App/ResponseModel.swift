//
//  ResponseModel.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/21/19.
//

import Vapor

struct BookingResponse: Content {
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
