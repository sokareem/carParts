//
//  ContentView.swift
//  CarParts
//
//  Created by Sinmisola Kareem on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    //By using the @State property wrapper and isPresented parameter with sheet, you control the visibility of the DashboardView.
    @State private var isShowingAnotherView = false
    var body: some View {
        TabView{
            // First Tab - ContentView
            VStack {
                Spacer(minLength: 50) // Add a minimum-length spacer to push the content to the base
                Button(action: {
                                isShowingAnotherView = true
                            }) {
                                Text("Go to  Dashboards")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                            .sheet(isPresented: $isShowingAnotherView) {
                                DashboardView().background(Color.green)
                            }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
//                Spacer(minLength: 10) // Add a minimum-length spacer to push the content to the base
            }
            .tabItem {
                            Label("Home", systemImage: "house")
                        }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the entire screen
                    .background(Color.yellow.ignoresSafeArea()) // Fill the background and ignore safe area
            
            // Second Tab - Dashboard View
                        DashboardView()
                            .tabItem {
                                Label("Dashboard", systemImage: "star")
                            }
            
            // Third Tab - Add the new tab item for LocationView
            LocationView()
                .tabItem {
                    LocationTabView()
                }
            
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
