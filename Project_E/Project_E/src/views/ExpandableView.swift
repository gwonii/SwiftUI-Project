//
//  OrganizationView.swift
//  Project_E
//
//  Created by gwonii on 2020/03/08.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("firstList")
        }
    }
}


struct ExpandableView: View {
    var body: some View {

        List {
            Section(header: HeaderView()) {
                ForEach(peopleData) { item in
                    VStack(alignment: .leading) {
                        // 이름
                        
                        Text(item.personName)
                            .font(.title)
                            .padding(.bottom, 12)
                            .padding(.leading, 8)
                        
                        HStack {
                            // 직급
                            Text(item.personRank)
                                .font(.body)
                            Text("|")
                                .padding(.leading, 4)
                                .padding(.trailing, 4)
                            // 직책
                            Text(item.personPosition)
                                .font(.body)
                        }
                        
                        HStack {
                            // 이메일
                            Text(item.personEmail)
                        }
                    }
                }
                .padding(.all, 4)
            }
        }
    }
}

struct ListView: View {
    var body: some View {
        Text("sample")
    }
}



struct ExpandableView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableView()
    }
}
