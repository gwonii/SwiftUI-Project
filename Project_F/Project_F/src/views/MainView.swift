//
//  MainView.swift
//  Project_F
//
//  Created by gwonii on 2020/03/09.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI



struct MainView: View {
    
    @ObservedObject var mainViewModel = MainViewModel()
    
    var body: some View {
        VStack {
            searchView
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List {
                ForEach(mainViewModel.trackData) { row in
                    HStack {
                        VStack(alignment: .leading) {
                            // name
                            HStack() {
                                Text(row.name)
                            }
                            // artsit
                            HStack {
                                Text(row.artist)
                            }
                        }
                        Spacer()
                        Button(action: {
                            print("i'm clicked")
                        }) {
                            Text("Download")
                                .font(.headline)
                                .foregroundColor(Color.red)
                        }
                    }
                    
                }
            }
        }
    }
}

private extension MainView {
    var searchView: some View {

        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search your favorite Music ", text: self.$mainViewModel.searchTerm)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
