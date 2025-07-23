//
//  StationRepository.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

protocol StationRepository {
    func getStations() async throws -> [Station]
}
