//  API+Error.swift
//  Quik Movies
//  Created by George Garcia on 5/18/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import Foundation

enum APIError: Error {
    
    static let title = "Oh no! Sorry about that!"
    
    case server, invalidRequest, badURL
    
    var description: String {
        switch self {
        case .server:
            return "Seems to be a server issue... We are working on it"
        case.invalidRequest:
            return "Invalid Request!"
        default:
            return "Bad URL"
        }
    }
    
}
