//
//  RegisterViewModel.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import Foundation
import FirebaseAuth

@MainActor
final class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var uiState: RegisterUIState = .idle
    @Published var isAuthenticated: Bool = false
    
    private let registerUseCase: RegisterUseCase
    private let session: SessionManager
    
    init(registerUseCase: RegisterUseCase, session: SessionManager) {
        self.registerUseCase = registerUseCase
        self.session = session
    }
    
    func registerUser() {
        Task {
            guard isFormValid else {
                uiState = .error("Correo no válido o contraseña menor a 8 caracteres")
                return
            }
            
            uiState = .loading
            do {
                let success = try await registerUseCase.execute(email: email, password: password)
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
    
    var isFormValid: Bool {
        return isValidEmail(email) && password.count >= 8
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
