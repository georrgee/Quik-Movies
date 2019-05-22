//  APIManager.swift
//  Quik Movies
//  Created by George Garcia on 5/18/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import Foundation

class APIManager {
    
    static let shared  = APIManager()
    static let baseURL = URL(string: baseURLPath)!
    
    func getList<T: Decodable>(listType: Type_Of_List, completionHandler: @escaping (T?, Error?) -> ()) {
        
        let base = APIManager.baseURL.appendingPathComponent(listType.rawValue)
        var urlComponents = URLComponents(url: base, resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "region", value: "US")
        ]
        
        guard let url = urlComponents?.url else {
            completionHandler(nil, APIError.badURL)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completionHandler(nil, error)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                switch httpResponse.statusCode {
                    
                case 400...499:
                    completionHandler(nil, APIError.invalidRequest)
                    return
                    
                case 500...599:
                    completionHandler(nil, APIError.server)
                    return
                    
                default:
                    break
                }
            }
            
            guard let data = data else {
                completionHandler(nil, APIError.server)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let object = try decoder.decode(T.self, from: data)
                completionHandler(object, nil)
            } catch {
                completionHandler(nil, error)
                return
            }
        }
        task.resume()
    }
    // Fetch Movie Details - Gets actors, directors, and all details about a movie
    func fetchMovieInfo(movieID: Int, completionHandler: @escaping (MovieInfo?, Error?) -> ()) {
        
        let base = baseURLPath + "movie/\(movieID)?api_key=\(apiKey)&language=en-US&append_to_response=credits,release_dates"
        
        guard let url = URL(string: base) else {
            completionHandler(nil, APIError.badURL)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completionHandler(nil, error)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                switch httpResponse.statusCode {
                case 400...499:
                    completionHandler(nil, APIError.invalidRequest)
                case 500...599:
                    completionHandler(nil, APIError.server)
                default:
                    break
                }
            }
            
            guard let data = data else {
                completionHandler(nil, APIError.server)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let object = try decoder.decode(MovieInfo.self, from: data)
                completionHandler(object, nil)
            } catch {
                completionHandler(nil, error)
                return
            }
        }
        task.resume()
    }
    
}
