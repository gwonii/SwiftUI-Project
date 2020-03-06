//
//  HomeView.swift
//  Project_A
//
//  Created by gwonii on 2020/02/24.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    enum Tab: Int {
        case Today, Message, Mans, Notification
    }
    
    var body: some View {
        TabView {
            TableView()
                .tabItem {
                    tabbarItem(text: "Today", image: "house")
            }.tag(Tab.Today)
            
            Text("Message를 주고 받는 페이지입니다.")
                .tabItem {
                    tabbarItem(text: "Message", image: "message.fill")
            }.tag(Tab.Message)
            
            Text("임직원 정보가 나타나는 페이지입니다.")
                .tabItem {
                    tabbarItem(text: "Mans", image: "bookmark.fill")
            }.tag(Tab.Mans)
            
            Text("알림을 보여주는 페이지입니다.")
                .tabItem {
                    tabbarItem(text: "Alarm", image: "alarm.fill")
            }.tag(Tab.Notification)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
