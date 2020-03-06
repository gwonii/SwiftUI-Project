//
//  EmailBoxView.swift
//  Project_A
//
//  Created by gwonii on 2020/02/24.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

struct EmailBoxView: View {
    var body: some View {
        HStack(alignment: .center) {
            
            VStack(alignment: .center) {
//                Image(systemName: "house")
                Rectangle()
                    .fill(Color(.lightGray))
                    .frame(width: 2, height: UIScreen.main.bounds.height / 2.5)
                    .padding(.trailing, 26)
                    .padding(.leading, 18)
            }
            
            // 내용부
            VStack(alignment: .leading) {
                Text("02-24 (월)")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.all, 8)
                VStack {
                    VStack {
                        ForEach(mailData) { mail in
                            VStack(alignment: .leading) {
                                Text("\(mail.mailTitle)")
                                
                                HStack {
                                    Spacer()
                                    Text("\(mail.time)")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.all, 8)
                        .background(Rectangle().fill(Color(.white)).padding(.bottom, 0.3))
//                        .background(Color(.white))
                    }.clipped()
                        .shadow(color: Color(.darkGray), radius: 1, x: 0, y: 2)
                    
                }.padding(.bottom, 40)
                    .background(Color(red: 225/255, green: 225/255, blue: 225/255))
            }.border(Color(.lightGray), width: 1)
            
        }.padding(.leading, 8)
            .padding(.trailing, 8)
    }
}

struct EmailBoxView_Previews: PreviewProvider {
    static var previews: some View {
        EmailBoxView()
    }
}
