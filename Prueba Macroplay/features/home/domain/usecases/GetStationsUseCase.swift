//
//  GetStationsUseCase.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

final class GetStationsUseCase {
    private let repository: StationRepository
    
    init(repository: StationRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Station] {
        try await repository.getStations()
    }
}
