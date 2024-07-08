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
            
            VStack(spacing: 0) {
                HeaderView()
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(viewModel.locations) { location in
                        if viewModel.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.primary.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
                .padding(.bottom, 20)
            }

        }
    }
}
#Preview {
    LocationsView()
        .environmentObject(LocationViewModel())
//        .preferredColorScheme(.dark)
}
