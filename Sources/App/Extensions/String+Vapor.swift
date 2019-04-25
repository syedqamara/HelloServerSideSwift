//
//  String+Vapor.swift
//  App
//
//  Created by Syed Qamar Abbas on 4/24/19.
//

import Foundation
extension String {
    
    var fromBase64: String? {
        
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    var toBase64: String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}
