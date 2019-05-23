//
//  GenresList.swift
//  Quik Movies
//
//  Created by George Garcia on 5/1/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
//

import Foundation

struct GenresList: Decodable {
    
    static var shared: [Genre]? = nil    
    var genres:        [Genre]
    
    func initWithData(data: Data) -> GenresList? {
        
        do {
            return try JSONDecoder().decode(GenresList.self, from: data)
        } catch {
            print("Genre List Decoding Failure")
            return nil
        }
    }
    
    func setGenreListWith(list: GenresList) {
        GenresList.shared = list.genres
    }
    
    func isListEmpty() -> Bool {
        return GenresList.shared != nil
    }

}
