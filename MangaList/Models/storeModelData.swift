import Foundation
import CoreLocation

var store = decodeJsonFromJsonFileStore(jsonFileName: "store.json")

// How to decode a json file into a struct
func decodeJsonFromJsonFileStore(jsonFileName: String) -> [storeData] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([storeData].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [storeData]
}
