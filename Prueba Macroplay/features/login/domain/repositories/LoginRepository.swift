//
//  LoginRepository.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

protocol LoginRepository {
    func login(email: String, password: String) async throws -> Bool
}
