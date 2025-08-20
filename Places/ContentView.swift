//
//  ContentView.swift
//  Places
//
//  Created by Elvia Rosas on 18/08/25.
//

import SwiftUI


struct ContentView: View {
    
@State private var placeVM = PlaceViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {

                List {
                    ForEach(placeVM.arrPlaces) { item in
                        
                        NavigationLink {
                            PlaceDetailView(place: item)
                        } label: {
                            PlaceRowView(place: item)
                        }

                    }
                }
            }
            .padding()
            
        }
        
    }
}

#Preview {
    ContentView()
}
