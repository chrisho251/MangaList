import Foundation
import SwiftUI

struct PopularManga: Hashable,Identifiable, Codable{
    var id: Int
    var name: String
    var rating: String
    var author: String
    var chapterNumber: String
    var description: String
    var price: String
    var genres: String

    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
