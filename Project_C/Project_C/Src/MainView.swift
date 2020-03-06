//
//  MainView.swift
//  Project_C
//
//  Created by gwonii on 2020/03/03.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    @State var presentAlert: Bool = false
    
    var body: some View {
        
        Form {
            Section {
                TextField("Input your name", text: $loginViewModel.userName)
                    .autocapitalization(.none)
            }
            
            Section {
                SecureField("Input your password", text: $loginViewModel.userPassword)
                SecureField("password again", text: $loginViewModel.userPasswordAgain)
            }
            
            Section {
                Button(action: {
                    self.signUp()
                }) {
                    Text("Sign Up")
                }
//                .disabled(!loginViewModel.isOk)
            }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView(userNameErrorMessage: self.loginViewModel.userNameMessage, userPasswordErrorMessage: self.loginViewModel.userPasswordMessage)
        }
    }
    
    func signUp() {
      self.presentAlert = true
    }
}

struct WelcomeView: View {
    
    var userNameErrorMessage: String
    var userPasswordErrorMessage: String
    
    var body: some View {
    
        if userNameErrorMessage != "" {
            return Text(userNameErrorMessage)
        } else if userPasswordErrorMessage != "" {
            return Text(userPasswordErrorMessage)
        } else {
            return Text("Welcome! Great to have you on board!")
        }
        
        
  }
}

struct UserNameError: View {
    
    var userNameErrorMessage: String
    
    var body: some View {
        Text(userNameErrorMessage)
    }
}

struct UserPasswordError: View {
    
    var userPasswordErrorMessage: String
    
    var body: some View {
        Text(userPasswordErrorMessage)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
