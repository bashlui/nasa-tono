//
//  Place.swift
//  Places
//
//  Created by Elvia Rosas on 18/08/25.
//

import Foundation

struct Place : Identifiable, Decodable {
    var id = UUID()
    var name : String
    var title: String
    var description: String
    var videoURL : String
    var imageName : [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case title
        case description
        case videoURL
        case imageName
    }
}

