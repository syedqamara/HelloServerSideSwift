//
//  DeeplinkController.swift
//  Run
//
//  Created by Syed Qamar Abbas on 4/24/19.
//

import Vapor
import FluentSQLite
import FluentPostgreSQL

final class DeeplinkController: NSObject {
    func deeplink(_ req: Request) throws -> Future<[Deeplink]> {
        return Deeplink.query(on: req).all()
    }
    func deeplinks(_ req: Request) throws -> Future<[Deeplink]> {
        return Deeplink.query(on: req).all()
    }
    func removeDeeplink(_ req: Request) throws -> Future<[Deeplink]> {
        return Deeplink.query(on: req).all()
    }
}
