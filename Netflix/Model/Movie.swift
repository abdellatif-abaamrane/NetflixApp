//
//  Movie.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import Foundation


struct Movie: Identifiable {
    let id = UUID()
    let name : String
    let thumbnailURL: URL
    let types : [MovieType]
    
    var year : Int
    var rating : String
    var numberOfSeasons: Int?
    var episodes : [Episode]?
    var moreLike : [Movie]?
    var trailers : [Trailer]?

    var promoText : String?
    var cast : String
    var creators : String
    
    private var customEpisodeInfo: CurrentEpisodeInfo?
    private var defaultEpisodeInfo: CurrentEpisodeInfo
    
    init(name:String,
         thumbnailURL:URL,
         types : [MovieType],
         year : Int,
         rating : String,
         numberOfSeasons: Int? = nil,
         episodes : [Episode]? = nil,
         promoText : String? = nil,
         defaultEpisodeInfo:CurrentEpisodeInfo,
         cast:String,
         creators : String,
         moreLike:[Movie]? = nil,
         trailers:[Trailer]? = nil) {
        self.trailers = trailers
        self.name = name
        self.thumbnailURL = thumbnailURL
        self.types = types
        self.year = year
        self.rating = rating
        self.numberOfSeasons = numberOfSeasons
        self.episodes = episodes
        self.promoText = promoText
        self.defaultEpisodeInfo = defaultEpisodeInfo
        self.cast = cast
        self.creators = creators
        self.moreLike = moreLike
        
    }
    var currentEpisodeInfo: CurrentEpisodeInfo {
        if let customEpisodeInfo = customEpisodeInfo {
            return customEpisodeInfo
        }
        return defaultEpisodeInfo
    }
    
    var numberOFSeasonsDisplay: String {
        if let numberOfSeasons = numberOfSeasons {
            if numberOfSeasons == 1 {
                return "1 Season"
            } else {
                return "\(numberOfSeasons) Seasons"
            }
        }
        return ""
    }
    
}

struct CurrentEpisodeInfo {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

var episodes = [Episode(name: "Hello", season: 1, thumbnailImageURLString: "https://picsum.photos/200/355", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 54, videoURL: exampleVideoURL,episodeNumber: 1),
                Episode(name: "Secret", season: 1, thumbnailImageURLString: "https://picsum.photos/200/356", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 14, videoURL: exampleVideoURL,episodeNumber: 2),
                Episode(name: "Mouse", season: 1, thumbnailImageURLString: "https://picsum.photos/200/357", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 67, videoURL: exampleVideoURL,episodeNumber: 3),
                Episode(name: "No One", season: 1, thumbnailImageURLString: "https://picsum.photos/200/358", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 53, videoURL: exampleVideoURL,episodeNumber: 4),
                Episode(name: "With me", season: 2, thumbnailImageURLString: "https://picsum.photos/200/359", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 34, videoURL: exampleVideoURL,episodeNumber: 1),
                Episode(name: "With me", season: 2, thumbnailImageURLString: "https://picsum.photos/200/335", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 45, videoURL: exampleVideoURL,episodeNumber: 2),
                Episode(name: "No One", season: 2, thumbnailImageURLString: "https://picsum.photos/200/345", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 86, videoURL: exampleVideoURL,episodeNumber: 3),
                Episode(name: "Mouse", season: 2, thumbnailImageURLString: "https://picsum.photos/200/325", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 45, videoURL: exampleVideoURL,episodeNumber: 4),
                Episode(name: "Secret", season: 3, thumbnailImageURLString: "https://picsum.photos/200/400", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 67, videoURL: exampleVideoURL,episodeNumber: 1),
                Episode(name: "Hello", season: 3, thumbnailImageURLString: "https://picsum.photos/200/334", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 23, videoURL: exampleVideoURL,episodeNumber: 2),
                Episode(name: "Secret", season: 3, thumbnailImageURLString: "https://picsum.photos/200/366", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 45, videoURL: exampleVideoURL,episodeNumber: 3),
                Episode(name: "Hello", season: 3, thumbnailImageURLString: "https://picsum.photos/200/323", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 34, videoURL: exampleVideoURL,episodeNumber: 4),
                Episode(name: "Hello", season: 3, thumbnailImageURLString: "https://picsum.photos/200/365", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 112, videoURL: exampleVideoURL,episodeNumber: 5),
                Episode(name: "Secret", season: 3, thumbnailImageURLString: "https://picsum.photos/200/321", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", duration: 54, videoURL: exampleVideoURL,episodeNumber: 6)]
