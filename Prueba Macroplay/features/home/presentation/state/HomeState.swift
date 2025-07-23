//
//  HomeState.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

enum HomeState {
    case loading
    case success([Station])
    case error(String)
}
