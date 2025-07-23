//
//  RegisterUseCase.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import Foundation

protocol RegisterUseCase {
    func execute(email: String, password: String) async throws -> Bool
}

final class RegisterUseCaseImpl: RegisterUseCase {
    private let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String) async throws -> Bool {
        try await repository.register(email: email, password: password)
    }
}

