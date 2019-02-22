//
//  ProductController.swift
//  App
//
//  Created by Syed Qamar Abbas on 2/20/19.
//
import Vapor
import FluentSQLite

final class ProductController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Product]> {
        return Product.query(on: req).all()
    }
    
    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Product> {
        return try req.content.decode(Product.self).flatMap { product in
            return product.save(on: req)
        }
    }
    
    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Product.self).flatMap { product in
            return product.delete(on: req)
            }.transform(to: .ok)
    }
}
