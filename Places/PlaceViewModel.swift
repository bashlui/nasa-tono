//
//  ViewModel.swift
//  Places
//
//  Created by Elvia Rosas on 18/08/25.
//

import Foundation

@Observable
class PlaceViewModel {
    
    var arrPlaces = [Place]()
    
    init() {
        
        arrPlaces = load("placesData.json")
        
        print(arrPlaces)
        
       /* var place = Place(name: "ChichenItza", title: "Chichen Itza", description: "Chichen Itza is a famous ancient Mayan city in Mexico, known for its impressive pyramid Kukulkan. It was a major center of politics, religion, and astronomy, and is now one of the New Seven Wonders of the World.", videoURL: "https://www.youtube.com/watch?v=sO7U78pUr34", imageName: ["ChichenItza", "ChichenItza2", "ChichenItza3"])
        arrPlaces.append(place)
        
        place = Place(name: "TajMahal", title: "Taj Mahal", description: "Emperor Shah Jahan in memory of his wife Mumtaz Mahal. It is considered one of the most beautiful architectural masterpieces in the world,", videoURL: "https://www.youtube.com/watch?v=Vu8kO9qxG4o", imageName: ["TajMahal", "TajMahal2", "TajMahal3"])
        arrPlaces.append(place)
        
        place = Place(name: "Colosseum", title: "Roman Colosseum", description: "The Colosseum was built in the 1st century AD in Rome. It hosted gladiator battles, public spectacles, and events, and remains one of the most iconic monuments of the Roman Empire.", videoURL: "https://www.youtube.com/watch?v=pJOwI-74xwY", imageName: ["Colosseum", "Colosseum2", "Colosseum3"])
        arrPlaces.append(place)*/
        
        
        
    }
    
        
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    
}
