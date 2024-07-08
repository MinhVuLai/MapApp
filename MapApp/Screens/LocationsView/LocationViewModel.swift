//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI
import MapKit

final class LocationViewModel: ObservableObject {
    
    // All loaded location
    @Published var locations: [Location]
    
    // Current lovation on map
    @Published var mapLocation: Location {
        didSet {
            self.updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        
        self.mapLocation = locations.first ?? LocationsDataService.testLocation
        
        self.updateMapRegion(location: mapLocation)
    }
    
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
}
