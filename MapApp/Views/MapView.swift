//
//  MapView.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var viewModel: LocationViewModel
    
    var body: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                Button {
                    viewModel.showChoosenLocation(location: location)
                } label: {
                    LocationMapAnnotationView()
                        .scaleEffect(viewModel.mapLocation == location ? 1.0 : 0.7)
                }
            }
        })
        .ignoresSafeArea()
    }
}

#Preview {
    MapView()
        .environmentObject(LocationViewModel())
}
