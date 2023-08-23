//
//  DashboardView.swift
//  CarParts
//
//  Created by Sinmisola Kareem on 7/9/23.
//

import SwiftUI
import Combine

struct DashboardView: View {
    @Environment(\.presentationMode) var presentationMode
    // Add search text state
    @State private var searchText = ""
    @State private var selectedMenuOption: String? = nil // Track the selected menu option
    var body: some View {
        VStack {
            // Search Bar
            HStack {
                // Dropdown Navigation Bar
                Menu {
                    Button(action: {
                        selectedMenuOption = "Year"
                    }) {
                        Label("Year", systemImage: "gear")
                    }
                    Button(action: {
                        selectedMenuOption = "Make"
                    }) {
                        Label("Make", systemImage: "star")
                    }
                    Button(action: {
                        selectedMenuOption = "Model"
                    }) {
                        Label("Model", systemImage: "star")
                    }
                    // Add more menu options as needed
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title)
                }
                .foregroundColor(.black)
                TextField("Search", text: $searchText)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 8)
                .opacity(searchText.isEmpty ? 0 : 1)
                
                // Cart Button
                Button(action: {
                    // Perform cart action
                }) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding(.leading, 8)
            }
            
            // Filtered Content
            List {
                // Display filtered data based on search text
                ForEach(filteredData, id: \.self) { item in
                    Text(item)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .background(Color.green.ignoresSafeArea())
            .listStyle(GroupedListStyle())
            Text("Welcome to the second view!")
                .font(.title)
                .foregroundColor(.blue)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Go back")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire screen
                .background(Color.yellow.ignoresSafeArea()) // Fill the background and ignore safe area
    }
    
    // Add computed property for filtered data
    private var filteredData: [String] {
        // Filter the original data based on the search text
        // For example:
        // Perform the API request here to get the data
        // You might use URLSession, Alamofire, or other networking libraries to perform the request.
        // For simplicity, let's assume the API response is an array of strings.
        // Replace YourAPIModel with your actual model representing the API response if needed.
        let apiResponse: [String] = ["Apple", "Banana", "Cherry", "Durian"]
        return apiResponse.filter { $0.contains(searchText) }
            
    }
}
