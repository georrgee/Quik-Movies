//  Movie.swift
//  Quik Movies

//  Created by George Garcia on 4/25/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import Foundation

struct Movie {
    
    var title:            String
    var originalTitle:    String
    var overview:         String
    var originalLanguage: String
    var releaseDate:      String
    var backdropPath:     String
    var posterPath:       String
    
    var genre_ids:        [Int]
    var id:               Int
    var voteCount:        Int
    
    var popularity:       Double
    var voteAverage:      Double
    
    var adult:            Bool
    var video:            Bool
    
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
    
}
