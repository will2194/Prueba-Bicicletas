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
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.green.opacity(0.3), .blue.opacity(0.3)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Iniciar Sesión")
                        .font(.largeTitle)
                        .bold()

                    TextField("Correo", text: $viewModel.email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)

                    SecureField("Contraseña", text: $viewModel.password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)

                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Entrar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                    }
                    .padding(.top, 10)

                    if case let .error(message) = viewModel.uiState {
                        Text(message)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
            }
        }
    }
    
}
