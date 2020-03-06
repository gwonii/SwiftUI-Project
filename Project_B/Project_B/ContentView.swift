//
//  ContentView.swift
//  Project_B
//
//  Created by gwonii on 2020/02/21.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI



enum CalculatorButton: String {
    case zero, one, two, three, four,
    five, six, seven, eight, nine
    case plus, minus, multiply, divide, equals
    case ac, plusMinus, percent
    case decimal
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .equals: return "="
        case .ac: return "ac"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .decimal: return "."
        } 
    }
        
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four,
             .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .plus, .minus, .multiply, .divide, .equals:
            return Color(.orange)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        }
    }
    
    func add() {
        
    }
}

// 보여지는 display가 있는 곳
// 예시1)
// 1-1 : "3" 을 클릭한다.
// 1-2 : "+" 를 클릭한다.
// 1-3 : "4" 를 클릭한다.
// 1-4 : "=" 을 클릭한다.

// 필요사항
// 입력한 데이터를 담아놓을 공간이 필요하다
// 연산처리를 할 메소드가 필요하다.
//
class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    func receiveInput(inputButton: CalculatorButton) {
        self.display = inputButton.title
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // 자판 내용 전체
            VStack(spacing: 10) {
                
                // 결과 값
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 76))
                }.padding()
                
                // 계산기 자판
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(buttonItem: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
}

struct CalculatorButtonView: View {
    
    var buttonItem: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            
            self.env.receiveInput(inputButton: self.buttonItem)
            
        }) {
            Text(self.buttonItem.title)
                .font(.system(size: 32))
                .frame(width: self.buttonWidth(self.buttonItem), height: self.buttonHeight(self.buttonItem))
                .foregroundColor(Color.white)
                .background(self.buttonItem.backgroundColor)
                .cornerRadius(self.buttonWidth(self.buttonItem))
        }
    }
    
    private func buttonWidth(_ buttonItem: CalculatorButton) -> CGFloat {
        if buttonItem == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 2
        }
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight(_ buttonItem: CalculatorButton) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
