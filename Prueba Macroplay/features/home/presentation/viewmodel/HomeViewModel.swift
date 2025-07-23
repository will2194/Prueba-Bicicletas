//
//  StationListViewModel.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var uiState: HomeState = .loading

    private let getStationsUseCase: GetStationsUseCase
    private let session: SessionManager

    init(getStationsUseCase: GetStationsUseCase, session: SessionManager) {
        self.getStationsUseCase = getStationsUseCase
        self.session = session
    }
    
    func getStations() {
        Task {
            uiState = .loading
            do {
                let stations = try await getStationsUseCase.execute()
                uiState = .success(stations)
            } catch {
                uiState = .error("No se pudieron obtener las estaciones: \(error.localizedDescription)")
            }
        }
    }
    
    func logout() {
        Task {
            session.logout()
        }
    }
}
