//  MovieInfo.swift
//  Quik Movies

//  Created by George Garcia on 5/1/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
// "movie details"

import Foundation

struct MovieInfo: Decodable {
    let credits: Credits
    let productionCompanies: [ProductionCompany]
    let releaseDates: ReleaseDates
    let runtime: Int?
}

struct Credits: Decodable {
    let cast: [CastMember]
    let crew: [CrewMember]
}

struct CastMember: Decodable {
    let name:        String
    let profilePath: String?
}

struct CrewMember: Decodable {
    let name:   String
    let job:    String
}

struct ProductionCompany: Decodable {
    let name: String
}

struct ReleaseDates: Decodable {
    let results: [Certification]
}

struct Certification: Decodable {
    let releaseDates: [RatingDetails]
    let iso31661: String
}

struct RatingDetails: Decodable {
    let certification: String
}
