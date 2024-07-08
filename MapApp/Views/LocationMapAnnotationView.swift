//
//  LocationMapAnnotationView.swift
//  MapApp
//
//  Created by Minh Vu Lai on 7/8/24.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(Color("ReversePrimary"))
                .padding(6)
                .background(Color.accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: 180))
                .foregroundStyle(Color.accentColor)
                .frame(width: 10, height: 10)
                .offset(y: -3)
        }
        .padding(.bottom, 40)
        .shadow(radius: 10)
    }
}

#Preview {
    LocationMapAnnotationView()
}
