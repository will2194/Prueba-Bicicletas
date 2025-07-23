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
    @Published var isAuthenticated: Bool = false

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
                    isAuthenticated = true
                } else {
                    uiState = .error("Credenciales inválidas, revise su correo o contraseña")
                }
            } catch _ as NSError {
                uiState = .error("Ocurrio un error intente mas tarde")
            }
        }
    }
}
