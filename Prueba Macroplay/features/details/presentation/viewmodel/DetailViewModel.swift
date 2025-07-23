//
//  DetailViewModel.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 23/07/25.
//

import Foundation
import MapKit

class DetailViewModel: ObservableObject {
    let station: Station
    
    @Published var region: MKCoordinateRegion
    
    init(station: Station) {
        self.station = station
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
}
