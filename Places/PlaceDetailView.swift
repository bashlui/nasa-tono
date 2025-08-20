//
//  PlaceDetailView.swift
//  Places
//
//  Created by Elvia Rosas on 18/08/25.
//

import SwiftUI

struct PlaceDetailView: View {
    let place : Place
    
    var body: some View {
        
        VStack{
            Image(place.imageName[0])
                .resizable()
                .scaledToFit()
            
            Text(place.title)
            Text(place.description)
            Link(destination: URL(string: place.videoURL)!) {
                Text("Video")
            }
            
        }
    }
}

#Preview {
    PlaceDetailView(place: Place(name: "ChichenItza", title: "Chichen Itza", description: "Description", videoURL: "https://www.youtube.com/watch?v=sO7U78pUr34", imageName: ["ChichenItza"]))
}
