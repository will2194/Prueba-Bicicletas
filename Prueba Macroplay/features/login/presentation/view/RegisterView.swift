//
//  RegisterView.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.green.opacity(0.5), .black.opacity(0.5)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Crear cuenta")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                    
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
                        Task { viewModel.registerUser() }
                    }) {
                        if case .loading = viewModel.uiState {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .frame(maxWidth: .infinity)
                        } else {
                            Text("Registrarse")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                    }
                    //.disabled(!viewModel.isFormValid)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .tint(.green)
    }
}
