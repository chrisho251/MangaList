//
//  ViewedManga.swift
//  MangaList
//
//  Created by Hoang, Ho Duy on 01/08/2022.
//

import Foundation
import SwiftUI

struct ViewedManga: Hashable,Identifiable, Codable{
    var id: Int
    var name: String
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
