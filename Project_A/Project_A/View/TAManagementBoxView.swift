//
//  TAManagementBoxView.swift
//  Project_A
//
//  Created by gwonii on 2020/02/24.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

enum TAButtons: String {
    case OnWork
    case OffWork
    case WorkStatus
    
    var title: String {
        switch self {
        case .OnWork:
            return "출근하기"
        case .OffWork:
            return "퇴근하기"
        case .WorkStatus:
            return "근무상태"
        }
    }
}

struct TAManagementBoxView: View {
    
    var body: some View {
        HStack(alignment: .center) {
            
            // 좌측 라인부
            VStack(alignment: .center) {
                Image(systemName: "home")
                    
                Rectangle()
                    .fill(Color(.lightGray))
                    .frame(width: 2, height: UIScreen.main.bounds.height / 3.4)
                    .padding(.trailing, 26)
                    .padding(.leading, 18)
            }
            // 내용부
            
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    HStack {
                        Text("02-24 (월)")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.all, 8)
                        Spacer()
                        Image(systemName: "bookmark")
                            .padding(.trailing, 16)
                    }
                    VStack() {
                        VStack() {
                            HStack {
                                Text("출근")
                                Text("미등록")
                                    .foregroundColor(Color(.gray))
                                Text("퇴근")
                                Text("미등록")
                                    .foregroundColor(Color(.gray))
                            }
                            
                            HStack {
                                Text("주간누적")
                                Text("0h 0m 0s")
                            }.padding(.bottom, 16)
                            
                            HStack {
                                TAManagementButtons(button: Buttons.OnWork)
                                Spacer()
                                TAManagementButtons(button: Buttons.OffWork)
                            }.padding(.bottom, 12)
                            
                            TAManagementButtons(button: Buttons.WorkingStatus)
                            
                        }.background(Rectangle().fill(Color(.white)).frame(width: geometry.size.width))
                                     
                                     
                    }.padding(.bottom, 40)
                        .background(Rectangle().fill(Color(red: 225/255, green: 225/255, blue: 225/255)).frame(width: geometry.size.width))
                }.border(Color(.lightGray), width: 1)
            }
        }.padding(.leading, 8)
            .padding(.trailing, 8)
    }
}

struct TAManagementBoxView_Previews: PreviewProvider {
    static var previews: some View {
        TAManagementBoxView()
    }
}
