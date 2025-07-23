//
//  LoginState.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

enum LoginUIState: Equatable {
    case idle
    case loading
    case success
    case error(String)
}
