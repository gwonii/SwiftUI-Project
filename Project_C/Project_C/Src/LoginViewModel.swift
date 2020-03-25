//
//  LoginViewModel.swift
//  Project_C
//
//  Created by gwonii on 2020/03/03.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    /// input
    @Published var userName: String = ""
    @Published var userPassword: String = ""
    @Published var userPasswordAgain: String = ""
    
    /// output
    @Published var userNameMessage: String = ""
    @Published var userPasswordMessage: String = ""
    @Published var isOk: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                print(input)
                return input.count >= 3
        }
        .eraseToAnyPublisher()
    }

    enum PasswordCheck {
        case valid
        case empty
        case noMatch
    }
    
    private var isPasswordsEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($userPassword, $userPasswordAgain)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password, passwordAgain in
                return password == passwordAgain
        }
        .eraseToAnyPublisher()
    }
    
    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($userPassword, $userPasswordAgain)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { userPassword, userPasswordAgain in
                print("password empty value : \(userPassword)  \(userPasswordAgain)")
                return userPassword == "" || userPasswordAgain == ""
        }
        .eraseToAnyPublisher()
    }

    private var isPasswordValidPublisher: AnyPublisher<PasswordCheck, Never> {
        Publishers.CombineLatest(isPasswordsEqualPublisher, isPasswordEmptyPublisher)
            .map { passwordIsEqual, passwordIsEmpty in
                if passwordIsEmpty {
                    print("passwordIsEmpty")
                    return .empty
                } else if !passwordIsEqual {
                    print("passwordNoMatch")
                    return .noMatch
                } else {
                    print("passwordIsValid")
                    return .valid
                }
        }
    .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUsernameValidPublisher, isPasswordValidPublisher)
            .map { userNameIsValid, passwordIsValid in
                return userNameIsValid && (passwordIsValid == .valid)
        }
        .eraseToAnyPublisher()
    }
    
    init() {
        isUsernameValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                print(valid)
                return valid ? "" : "User name must at least have 3 characters"
        }
        .assign(to: \.userNameMessage, on: self)
        .store(in: &cancellableSet)

        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .map { PasswordCheck in
                switch PasswordCheck {
                case .empty:
                    return "Password is empty"
                case .noMatch:
                    return "Password don't match"
                default:
                    return ""
                }
        }
        .assign(to: \.userPasswordMessage, on: self)
        .store(in: &cancellableSet)
        
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isOk, on: self)
            .store(in: &cancellableSet)
    }

}


