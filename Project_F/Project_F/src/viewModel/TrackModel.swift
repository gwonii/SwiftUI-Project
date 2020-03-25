//
//  TrackModel.swift
//  Project_F
//
//  Created by gwonii on 2020/03/09.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI


let sampleData: [TrackModel] = [
    TrackModel(name: "aaaa", artist: "aaaa", previewURL: URL(fileURLWithPath: "")),
    TrackModel(name: "bbbb", artist: "bbbb", previewURL: URL(fileURLWithPath: "")),
    TrackModel(name: "cccc", artist: "cccc", previewURL: URL(fileURLWithPath: "")),
    TrackModel(name: "dddd", artist: "dddd", previewURL: URL(fileURLWithPath: ""))

]

class TrackModel: Identifiable {
    
    let id = UUID()
    let name: String
    let artist: String
    let previewURL: URL
    
    init(name: String, artist: String, previewURL: URL) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
    }
}


//@Published var artist: String
//@Published var index: Int
//@Published var name: String
//@Published var previewURL: URL
