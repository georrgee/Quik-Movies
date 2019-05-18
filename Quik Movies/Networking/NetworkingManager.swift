//  NetworkingManager.swift
//  Quik Movies

//  Created by George Garcia on 5/17/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import Foundation

let apiKey  = "f2448e7d924f45f280a5db37ec9619b1"
let baseURL = "https://api.themoviedb.org/3/" // double check later for: org/3/ <--- 3

enum Country: String {
    case USA = "US"
}

enum JobRole: String {
    case director = "Director"
}

enum ImageType: String {
    
    case moviePoster, movieBackdrop, movieCast
    
    var rawValue: String {
        switch self {
        case .moviePoster:
            return "http://image.tmdb.org/t/p/w185"
        case .movieCast:
            return "http://image.tmdb.org/t/p/w45"
        default:
            return "http://image.tmdb.org/t/p/w780"
        }
    }
}

enum Type_Of_List: String {
    
    case nowPlaying, upcoming, genres, poster
    
    var rawValue: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        case .genres:
            return "genre/movie/list"
        default:
            return "movie/upcoming"
        }
    }
}
