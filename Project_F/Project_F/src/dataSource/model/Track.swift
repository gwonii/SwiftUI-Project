//
//  Track.swift
//  Project_F
//
//  Created by gwonii on 2020/03/14.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation

// MARK: - Track
//

/// Query service creates Track objects
class Track: Identifiable, Hashable{
    
    var hashValue: Int {
        return self.id.hashValue
    }
    
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    //
    // MARK: - Constants
    //
    let id = UUID()
    let artist: String
    let index: Int
    let name: String
    let previewURL: URL
    
    //
    // MARK: - Variables And Properties
    //
    var downloaded = false
    
    //
    // MARK: - Initialization
    //
    init(name: String, artist: String, previewURL: URL, index: Int) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
        self.index = index
    }
}
