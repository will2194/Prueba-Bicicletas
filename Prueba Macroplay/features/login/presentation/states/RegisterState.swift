//
//  RegisterState.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import Foundation

enum RegisterUIState: Equatable {
    case idle
    case loading
    case success
    case error(String)
}
