//
//  LoginUseCase.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

protocol LoginUseCase {
    func execute(email: String, password: String) async throws -> Bool
}

final class LoginUseCaseImpl: LoginUseCase {
    private let repository: LoginRepository

    init(repository: LoginRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> Bool {
        try await repository.login(email: email, password: password)
    }
}
