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
                    uiState = .error("Credenciales inválidas, revise su correo o contraseña")
                }
            } catch let error as NSError {
                let message = firebaseErrorMessage(error)
                uiState = .error(message)
            }
        }
    }

    private func firebaseErrorMessage(_ error: NSError) -> String {
        switch AuthErrorCode(rawValue: error.code) {
        case .wrongPassword:
            return "Contraseña incorrecta"
        case .invalidEmail:
            return "Correo inválido"
        case .userNotFound:
            return "Usuario no encontrado"
        default:
            return error.localizedDescription
        }
    }
}
