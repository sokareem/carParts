//
//  MapView.swift
//  CarParts
//
//  Created by Sinmisola Kareem on 7/22/23.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: UIViewRepresentable {
    var searchQuery: String // The search query for car parts shops
       @State private var mapItems: [MKMapItem] = [] // To store the search results
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // You can implement any necessary map updates or annotations here
        
        // Perform the search and update the map with search results
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchQuery
        let localSearch = MKLocalSearch(request: searchRequest)
        
        localSearch.start { response, error in
            guard let response = response, error == nil else {
                print("Error searching for car parts shops: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Clear any previous annotations
            uiView.removeAnnotations(uiView.annotations)
            
            // Store the search results
            mapItems = response.mapItems
            
            // Add annotations for each car parts shop found
            for item in mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                uiView.addAnnotation(annotation)
            }
            
            // Optionally, set the map's region to show the search results
            if let firstItem = mapItems.first {
                let region = MKCoordinateRegion(center: firstItem.placemark.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                uiView.setRegion(region, animated: true)
            }
            
        }
        
    }
}
