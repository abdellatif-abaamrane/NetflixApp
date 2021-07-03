//
//  Trailer.swift
//  Netflix
//
//  Created by ********* on 01/06/2020.
//

import Foundation


struct Trailer: Identifiable {
    let id = UUID()
    var name : String
    var videoURL: URL
    var thumbnailImageURL : URL
}
