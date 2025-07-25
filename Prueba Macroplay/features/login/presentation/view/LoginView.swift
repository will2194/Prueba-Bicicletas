//
//  LoginView.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    @StateObject private var registerViewModel: RegisterViewModel
    
    init(viewModel: LoginViewModel, registerViewModel: RegisterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _registerViewModel = StateObject(wrappedValue: registerViewModel)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.green.opacity(0.5), .black.opacity(0.5)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Iniciar Sesión")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Correo", text: $viewModel.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                    
                    SecureField("Contraseña", text: $viewModel.password)
                        .textContentType(.password)
                        .keyboardType(.default)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                    
                    if case let .error(message) = viewModel.uiState {
                        Text(message)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button(action: {
                        viewModel.login()
                    }) {
                        if case .loading = viewModel.uiState {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .frame(maxWidth: .infinity)
                        } else {
                            Text("Entrar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.top, 10)
                    
                    NavigationLink("¿No tienes cuenta? Regístrate aquí") {
                        RegisterView(viewModel: registerViewModel)
                    }
                    .foregroundColor(.black)
                    .underline()
                    .padding(.top, 10)
                    
                }
                .padding()
            }
        }
    }
    
}
