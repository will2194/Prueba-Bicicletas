//
//  Station.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

struct Station: Identifiable {
    let id: String
    let name: String
    let freeBikes: Int
    let emptySlots: Int
    let latitude: Double
    let longitude: Double
}
