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
    let maxWidthForIPad: CGFloat = 700
    
    var body: some View {
        ZStack {
            MapView()
            
            VStack(spacing: 0) {
                HeaderView()
                    .padding()
                    .frame(maxWidth: maxWidthForIPad)
                
                Spacer()
                
                ZStack {
                    ForEach(viewModel.locations) { location in
                        if viewModel.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.primary.opacity(0.3), radius: 20)
                                .padding()
                                .frame(maxWidth: maxWidthForIPad)
                                .frame(maxWidth: .infinity)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationViewModel())
//        .preferredColorScheme(.dark)
}
