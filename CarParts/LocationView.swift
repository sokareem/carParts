//
//  LocationView.swift
//  CarParts
//
//  Created by Sinmisola Kareem on 7/22/23.
//


import SwiftUI
import MapKit

struct LocationView: View {
    // You can use this view to display the map with the nearest car stores
    var searchQuery: String = "Car Parts Shop" // Your desired search query

        var body: some View {
            MapView(searchQuery: searchQuery)
                .edgesIgnoringSafeArea(.all)
        }
    
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
