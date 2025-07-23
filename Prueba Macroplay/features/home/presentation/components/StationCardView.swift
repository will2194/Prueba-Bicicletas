//
//  StationCardView.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import SwiftUI

struct StationCardView: View {
    let station: Station
    

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(station.name)
                .font(.headline)
                .foregroundColor(.darkText)

            HStack {
                Label("\(station.freeBikes)", systemImage: "bicycle").foregroundColor(.green)
                Spacer()
                Label("\(station.emptySlots)", systemImage: "square.grid.2x2").foregroundColor(.orange)
            }
            .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
