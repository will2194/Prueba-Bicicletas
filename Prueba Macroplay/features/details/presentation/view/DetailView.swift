//
//  DetailView.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $viewModel.region, annotationItems: [viewModel.station]) { station in
                MapMarker(
                    coordinate: CLLocationCoordinate2D(
                        latitude: station.latitude,
                        longitude: station.longitude
                    ),
                    tint: .green
                )
            }
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                Text(viewModel.station.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                VStack(spacing: 12) {
                    detailRow(title: "Bicicletas disponibles", value: "\(viewModel.station.freeBikes)", detailColor: .green)
                    detailRow(title: "Espacios vacíos", value: "\(viewModel.station.emptySlots)", detailColor: .orange)
                    detailRow(title: "Latitud", value: String(format: "%.5f", viewModel.station.latitude), detailColor: .black)
                    detailRow(title: "Longitud", value: String(format: "%.5f", viewModel.station.longitude), detailColor: .black)
                }
                
                Spacer(minLength: 10)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 250)
            .background(BlurView(style: .systemThinMaterialDark))
            .cornerRadius(24, corners: [.topLeft, .topRight])
            .shadow(radius: 10)
        }
        .accentColor(.green)
        .tint(.green)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func detailRow(title: String, value: String, detailColor: Color) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .foregroundColor(detailColor)
                .bold()
        }
        .padding(.horizontal, 4)
    }
}
