//  Movie.swift
//  Quik Movies

//  Created by George Garcia on 4/25/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import Foundation

struct Movie: Decodable, Equatable {
    
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
    
    var genres: String {
        
        let matchedGenres: [Genre]?  = GenresList.shared?.filter { genre_ids.contains($0.id) }
        let genreNames               = matchedGenres?.map{ $0.name}
        let list                     = genreNames?.joined(separator: ", ")
        
        return list ?? "Unknown"
    }
    
    var cast:                 [CastMember]?
    var directors:            String?
    var productionCompanies:  String?
    var mpaaRating:           String?
    var length:               String?
    
}
