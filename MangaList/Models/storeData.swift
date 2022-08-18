import Foundation
import SwiftUI
import CoreLocation

struct storeData: Identifiable, Codable{
    var id: Int
    var name: String
    var phone: String
    var email: String
    var location: String
    
    var coordinates: Coordinates
       
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
