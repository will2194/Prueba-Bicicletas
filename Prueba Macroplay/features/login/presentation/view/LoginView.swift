//
//  LoginView.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            TextField("Correo", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if case .loading = viewModel.uiState {
                ProgressView()
            }

            Button("Iniciar sesión") {
                viewModel.login()
            }
            .disabled(viewModel.uiState == .loading)

            if case let .error(message) = viewModel.uiState {
                Text(message).foregroundColor(.red)
            }

            if case .success = viewModel.uiState {
                Text("¡Bienvenido! 🎉").foregroundColor(.green)
            }
        }
        .padding()
    }
}
