//
//  PlaceViewRow.swift
//  Places
//
//  Created by Elvia Rosas on 18/08/25.
//

import SwiftUI

struct PlaceRowView: View {
    
    let place : Place
    
    var body: some View {
        
        HStack{
            Image(place.imageName[0])
                .resizable()
                .scaledToFit()
                .frame(width:100)
            
            Text(place.name)
        }
    }
}

#Preview {
    PlaceRowView(place: Place(name: "ChichenItza", title: "Chichen Itza", description: "Description", videoURL: "", imageName: ["ChichenItza"]))
}
