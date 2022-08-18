//
//  TrendingManga.swift
//  MangaList
//
//  Created by Hoang, Ho Duy on 07/08/2022.
//

import Foundation
import SwiftUI

struct TrendingManga: Hashable,Identifiable, Codable{
    var name: String
    var id: Int
    var rating: String
    var author: String
    var description: String
    var chapterNumber: String
    var price: String
    var genres: String

    var imageName: String
    var image: Image {
        Image(imageName)
    }

}
