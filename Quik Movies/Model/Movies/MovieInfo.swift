//  MovieInfo.swift
//  Quik Movies

//  Created by George Garcia on 5/1/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
// "movie details"

import Foundation

struct MovieInfo {
    let credits: Credits
    let productionCompanies: [ProductionCompany]
    let releaseDates: ReleaseDates
    let runtime: Int?
}

struct Credits {
    let cast: [CastMember]
    let crew: [CrewMember]
}

struct CastMember {
    let name:        String
    let profilePath: String?
}

struct CrewMember {
    let name:   String
    let job:    String
}

struct ProductionCompany {
    let name: String
}

struct ReleaseDates {
    let results: [Certification]
}

struct Certification {
    let releaseDates: [RatingDetails]
    let iso31661: String
}

struct RatingDetails {
    let certification: String
}
