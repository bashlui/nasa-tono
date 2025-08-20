import Foundation

@MainActor
@Observable
class PlaceViewModel {
    
    var arrPlaces = [Place]()
    
    init() {
        // Load local data first as fallback
        arrPlaces = load("placesData.json")
        
        Task {
            await loadAPI()
        }
        
        print(arrPlaces)
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
    
    func loadAPI() async {
        do {
            guard let url = URL(string: "https://tec-actions-test-production.up.railway.app/places") else {
                print("Invalid URL")
                return
            }
            
            let urlRequest = URLRequest(url : url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("HTTP error - status code not 200")
                return
            }
            
            let results = try JSONDecoder().decode([Place].self, from: data)
            
            self.arrPlaces = results
            print("Successfully loaded \(results.count) places from API")
            
        } catch {
            print("Failed to load API data: \(error)")
            // arrPlaces already contains local data as fallback
        }
    }
}
