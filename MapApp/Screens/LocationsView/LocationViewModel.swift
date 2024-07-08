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
        
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    
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
    
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    
    func showChoosenLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    
    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            return
        }
        
        // Check if the currentindex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            let firstLocation = locations.first ?? LocationsDataService.testLocation
            showChoosenLocation(location: firstLocation)
            return
        }
        
        // nextIndex is valid
        let nextLocation = locations[nextIndex]
        showChoosenLocation(location: nextLocation)
    }
}
