//
//  Episode.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import Foundation



struct Episode : Identifiable {
    let id = UUID()
    let name : String
    let season : Int
    let thumbnailImageURLString : String
    let description : String
    let duration : Int
    let videoURL : URL
    let episodeNumber : Int
    var thumbnailURL : URL {
        URL(string: thumbnailImageURLString)!
    }

}
