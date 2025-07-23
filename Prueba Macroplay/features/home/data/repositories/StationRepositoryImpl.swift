//
//  StationRepositoryImpl.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

final class StationRepositoryImpl: StationRepository {
    func getStations() async throws -> [Station] {
        guard let url = URL(string: "https://api.citybik.es/v2/networks/ecobici") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(EcoBiciResponseModel.self, from: data)

        return decoded.network.stations.map { ecoBiciResponseModel in
            Station(
                id: ecoBiciResponseModel.id,
                name: ecoBiciResponseModel.name,
                freeBikes: ecoBiciResponseModel.free_bikes,
                emptySlots: ecoBiciResponseModel.empty_slots,
                latitude: ecoBiciResponseModel.latitude,
                longitude: ecoBiciResponseModel.longitude
            )
        }
    }
}

