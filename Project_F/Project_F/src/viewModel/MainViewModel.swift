//
//  MainViewModel.swift
//  Project_F
//
//  Created by gwonii on 2020/03/17.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    
    let serviceQuery: ServiceQuery = .shared
    let dispatchQueue = DispatchQueue(label: "query")
    
    @Published var trackData: [Track] = []
    @Published var searchTerm: String = ""
//    var trackData: [Track] {
//
//        // 해당부분에 동기화를 진행해주어야 한다.
//        // 하지만 조건은 main dispatchqueue는 sync하지 않을 것!
//        self.serviceQuery.urlQuery(searchTerm: self.searchTerm)
//        let tracks = self.serviceQuery.tracks
//        sleep(2)
//        print(self.searchTerm)
//
//        return tracks
//    }

    
    private var cancellableSet: Set<AnyCancellable> = []

    private var searchTermCheck: AnyPublisher<String, Never> {
        $searchTerm
        .eraseToAnyPublisher()
    }
//
//    private func createFuture(searchTerm: String) -> Future<[Track], Never> {
//        return Future { promise in
//            self.serviceQuery.urlQuery(searchTerm: searchTerm)
//            let tracks = self.serviceQuery.tracks
//            promise(.success(tracks))
//        }
//    }

    init() {
        searchTermCheck
//            .delay(for: 1, scheduler: RunLoop.main)
            .debounce(for: 1, scheduler: RunLoop.main)
            .map { result in
                
                self.serviceQuery.urlQuery(searchTerm: result)
                sleep(1)
                
                print(result)
                return self.serviceQuery.tracks
        }
        .assign(to: \.self.trackData, on: self)
        .store(in: &self.cancellableSet)
        
        

//        self._searchTerm.projectedValue.map { result in
//            self.serviceQuery.urlQuery(searchTerm: result)
//            self.trackData = self.serviceQuery.tracks
//            print(result)
//            return self.trackData
//        }
//        .sink { (trackData: [Track]) in
//            self.trackData = trackData
//        }
//        .store(in: &self.cancellableSet)
        
//        self._trackData.projectedValue.sink { result in
//            print("trackData emitted: \(result.count.description)")
//        }
//        .store(in: &self.cancellableSet)
    }
}



