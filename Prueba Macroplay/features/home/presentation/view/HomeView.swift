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
                
                LinearGradient(colors: [.green.opacity(0.5), .black.opacity(0.5)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
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
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .padding(.horizontal)
                    .foregroundColor(Color.green)
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
            ProgressView("Cargando estaciones...").tint(.black).accentColor(.black)
        case .error(let message):
            Text(message)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        case .success(let stations):
            let stationsShow: [Station] = Array(stations.prefix(50))
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(stationsShow) { station in
                        NavigationLink(
                            destination: DetailView(viewModel: DetailViewModel(station: station))
                        ) {
                            StationCardView(station: station)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.top)
            }
        }
    }
}
