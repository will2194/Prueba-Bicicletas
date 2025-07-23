//
//  LoginViewModel.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation
import FirebaseAuth

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var uiState: LoginUIState = .idle
    
    private let loginUseCase: LoginUseCase
    private let session: SessionManager
    
    init(loginUseCase: LoginUseCase, session: SessionManager) {
        self.loginUseCase = loginUseCase
        self.session = session
    }
    
    func login() {
        Task {
            uiState = .loading
            do {
                let success = try await loginUseCase.execute(email: email, password: password)
                if success {
                    uiState = .success
                    session.isLoggedIn = true
                } else {
                    uiState = .error("Ocurrio un error intente mas tarde")
                }
            } catch _ as NSError {
                uiState = .error("Ocurrio un error intente mas tarde")
            }
        }
    }
}
