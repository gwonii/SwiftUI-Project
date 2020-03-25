//
//  ServiceQuery.swift
//  Project_F
//
//  Created by gwonii on 2020/03/14.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation


// 싱글톤으로 urlSession을 사용해보자 .

class ServiceQuery {
    
    // MARK: - Singleton Structure
    //
    static let shared = ServiceQuery()
    private init() {}
    
    // MARK: - Type Alias
    //
    typealias JSONDictionary = [String: Any]
    typealias QueryResult = ([Track]?, String) -> Void
    
    
    // MARK: - Property
    //
    // default 형태로 URLSession을 만들어준다.
    let defaultSession = URLSession(configuration: .default)
    
    // dataTask는 일단 optional로 생성하고
    var dataTask: URLSessionDataTask?
    
    //    var searchTerm: String = ""
    var errorMsg: String = ""
    var tracks: [Track] = []
    
    
    // MARK: - Internal Methods
    //
    func urlQuery(searchTerm: String) {
        
        /// step 1
        dataTask?.cancel()
        
        /// step 2
        // 해당 url에서 올바른 데이터가 존재 한다면,
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            
            /// step 3
            //
            guard let url = urlComponents.url else {
                return
            }
            
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                
                /// step 4
                if let error = error {
                    self?.errorMsg += "DataTask error : \(error.localizedDescription) \n"
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    self?.updateSearchResults(data)
                }
            }
        }
        dataTask?.resume()
    }
    
    // MARK: - Private Methods
    //
    private func updateSearchResults(_ data: Data) {
        var response: JSONDictionary?
        tracks.removeAll()
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMsg += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        guard let array = response!["results"] as? [Any] else {
            errorMsg += "Dictionary does not contain results key\n"
            return
        }
        
        var index = 0
        
        for trackDictionary in array {
            if let trackDictionary = trackDictionary as? JSONDictionary,
                let previewURLString = trackDictionary["previewUrl"] as? String,
                let previewURL = URL(string: previewURLString),
                let name = trackDictionary["trackName"] as? String,
                let artist = trackDictionary["artistName"] as? String {
                tracks.append(Track(name: name, artist: artist, previewURL: previewURL, index: index))
                index += 1
            } else {
                errorMsg += "Problem parsing trackDictionary\n"
            }
        }
    }
}
