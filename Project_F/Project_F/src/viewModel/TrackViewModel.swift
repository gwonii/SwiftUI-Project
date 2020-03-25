//
//  TrackViewModel.swift
//  Project_F
//
//  Created by gwonii on 2020/03/09.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

class TrackViewModel: ObservableObject {
    
    @Published var artist: String
    @Published var index: Int
    @Published var name: String
    @Published var previewURL: URL
    
    init(name: String, artist: String, previewURL: URL, index: Int) {
      self.name = name
      self.artist = artist
      self.previewURL = previewURL
      self.index = index
    }
}

