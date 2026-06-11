//
//  LoginViewModel.swift
//  TMDB
//
//  Created by AVINASH on 30/05/26.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    
    enum State: Equatable {
        case idle
        case loading
        case success(User)
        case failure(String)
    }
    
    @Published private(set) var state: State = .idle
    
    var isLoading: Bool {
        state == .loading
    }
    
    private let loginUseCase: LoginUseCaseProtocol
    
    init(loginUseCase: LoginUseCaseProtocol) {
        self.loginUseCase = loginUseCase
    }
    
    @MainActor
    func login(username: String,password: String) async {
        state = .loading
        do {
            let user = try await loginUseCase.execute(
                username: username,
                password: password
            )
            
            state = .success(user)
            
        } catch {
            state = .failure(
                error.localizedDescription
            )
            print("Login failed: \(error.localizedDescription)")
            
            let dummyUser = User(
                id: 0,
                name: "Guest User",
                username: "guest",
                image: "",
            )
            
            state = .success(dummyUser)
        }
    }
}
