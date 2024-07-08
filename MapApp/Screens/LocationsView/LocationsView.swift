//
//  LocationsView.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView().environmentObject(LocationViewModel())
}
