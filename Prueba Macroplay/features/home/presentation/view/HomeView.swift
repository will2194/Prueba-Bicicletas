//
//  HomeView.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightGray.ignoresSafeArea()

                content
                    .navigationTitle("Estaciones")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                viewModel.logout()
                            }) {
                                Image(systemName: "rectangle.portrait.and.arrow.right").foregroundColor(.red)
                            }
                        }
                    }
                    .padding(.horizontal)
            }
        }
        .onAppear {
            viewModel.getStations()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.uiState {
        case .loading:
            ProgressView("Cargando estaciones...")
        case .error(let message):
            Text(message)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        case .success(let stations):
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(stations) { station in
                        StationCardView(station: station)
                    }
                }
                .padding(.top)
            }
        }
    }
}
