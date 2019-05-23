//
//  MoviesList.swift
//  Quik Movies
//
//  Created by George Garcia on 5/1/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
//

import Foundation

struct MoviesList: Decodable {
    
    var results: [Movie] // array of movies
    
    func initWithData(data: Data) -> MoviesList? {
        
        do {
            return try JSONDecoder().decode(MoviesList.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
}
