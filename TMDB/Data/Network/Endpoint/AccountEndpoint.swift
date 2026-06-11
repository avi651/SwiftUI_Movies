//
//  AccountEndpoint.swift
//  TMDB
//
//  Created by AVINASH on 28/05/26.
//

import Foundation

enum AccountEndpoint: Endpoint {
    case userDetail(sessionId: SessionID)
    
    var path: String {
        return "account"
    }
    
    var queryItems: [URLQueryItem]? {
        if case let .userDetail(sessionId) = self {
            return [.init(name: "session_id", value: sessionId)]
        }
        return nil
    }
    
    var method: RequestMethod {
        return .get
    }
}
