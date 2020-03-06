//
//  TAManagementButtons.swift
//  Project_A
//
//  Created by gwonii on 2020/02/25.
//  Co  

import SwiftUI


enum Buttons {
    case OnWork
    case OffWork
    case WorkingStatus
    
    var title: String {
        switch self {
        case .OnWork:
            return "출근하기"
        case .OffWork:
            return "퇴근하기"
        case .WorkingStatus:
            return "근무상태"
        }
    }
}

struct OnWorkButton: View {
    
    var body: some View {
        Text(Buttons.OnWork.title)
            .font(.system(size: 20))
            // color
            .foregroundColor(Color(red: 100/255, green: 190/255, blue: 200/255))
            // size
            .frame(width: (UIScreen.main.bounds.width - 5 * 12) / 2.5  , height: (UIScreen.main.bounds.width - 5 * 12) / 7.5)
            .background(Color(.white))
            .cornerRadius((UIScreen.main.bounds.width - 5 * 12) / 4)
            .overlay(
                RoundedRectangle(cornerRadius: (UIScreen.main.bounds.width - 5 * 12) / 4)
                    .stroke(Color(red: 100/255, green: 190/255, blue: 200/255), lineWidth: 2)
        ).padding(.leading, 12)
    }
}

struct OffWorkButton: View {
    var body: some View {
        Text(Buttons.OffWork.title)
            .font(.system(size: 20))
            .foregroundColor(Color(red: 100/255, green: 190/255, blue: 200/255))
            .frame(width: (UIScreen.main.bounds.width - 5 * 12) / 2.5  , height: (UIScreen.main.bounds.width - 5 * 12) / 7.5)
            .background(Color(.white))
            .cornerRadius((UIScreen.main.bounds.width - 5 * 12) / 4)
            .overlay(
                RoundedRectangle(cornerRadius: (UIScreen.main.bounds.width - 5 * 12) / 4)
                    .stroke(Color(red: 100/255, green: 190/255, blue: 200/255), lineWidth: 2)
        ).padding(.trailing, 12)
    }
}

struct WorkingStatus: View {
    var body: some View {
        Text(Buttons.WorkingStatus.title)
            .font(.system(size: 20))
            .foregroundColor(Color(red: 100/255, green: 190/255, blue: 200/255))
            .frame(width: (UIScreen.main.bounds.width - 5 * 12) / 1.2  , height: (UIScreen.main.bounds.width - 5 * 12) / 7.5)
            .background(Color(.white))
            .cornerRadius((UIScreen.main.bounds.width - 5 * 12) / 4)
            .overlay(
                RoundedRectangle(cornerRadius: (UIScreen.main.bounds.width - 5 * 12) / 4)
                    .stroke(Color(red: 100/255, green: 190/255, blue: 200/255), lineWidth: 2)
        ).padding(.bottom, 12)
    }
}

struct TAManagementButtons: View {
    
    let button: Buttons
    
    var body: some View {
        
        switch button {
        case .OnWork:
            return AnyView(OnWorkButton())
        case .OffWork:
            return AnyView(OffWorkButton())
        case .WorkingStatus:
            return AnyView(WorkingStatus())
        }
    }
}

