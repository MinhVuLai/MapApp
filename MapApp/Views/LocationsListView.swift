//
//  LocationsListView.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showChoosenLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}


extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .clipShape(.rect(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}
