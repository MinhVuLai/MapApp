//
//  HeaderView.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.toggleLocationsList()
            } label: {
                Text("\(viewModel.mapLocation.name), \(viewModel.mapLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
                    }
            }
            
            if viewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3),
                radius: 20,
                x: 0, y: 15)
    }
}

#Preview {
    HeaderView()
        .environmentObject(LocationViewModel())
}
