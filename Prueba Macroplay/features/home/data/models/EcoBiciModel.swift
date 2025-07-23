//
//  EcoBiciModel.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

struct EcoBiciResponseModel: Decodable {
    let network: NetworkModel
}

struct NetworkModel: Decodable {
    let id: String
    let name: String
    let stations: [StationModel]
}

struct StationModel: Decodable {
    let id: String
    let name: String
    let free_bikes: Int
    let empty_slots: Int
    let latitude: Double
    let longitude: Double
}
