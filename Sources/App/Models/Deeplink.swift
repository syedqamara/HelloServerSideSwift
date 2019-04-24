//
//  Deeplink.swift
//  App
//
//  Created by Syed Qamar Abbas on 4/24/19.
//

import FluentSQLite
import Vapor
import FluentPostgreSQL

final class Deeplink: PostgreSQLModel {
    var id: Int?
    var scheme: String?
    var query_param: String?
    var app_identifier: String?
    var app_name: String?
    
    init(id: Int? = nil, sch: String, qp: String, app_id: String, app_n: String) {
        self.id = id
        self.scheme = sch
        self.query_param = qp
        self.app_identifier = app_id
        self.app_name = app_n
    }
}
/// Allows `Deeplink` to be used as a dynamic migration.
extension Deeplink: Migration { }

/// Allows `Deeplink` to be encoded to and decoded from HTTP messages.
extension Deeplink: Content { }

/// Allows `Deeplink` to be used as a dynamic parameter in route definitions.
extension Deeplink: Parameter { }
