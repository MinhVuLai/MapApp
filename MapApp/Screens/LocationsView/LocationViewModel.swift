//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import Foundation

final class LocationViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
