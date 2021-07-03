//
//  NetflixApp.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI

@main
struct NetflixApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//            MovieDetail(movie: Movie(name: "ALONE",
//                                     thumbnailURL: URL(string: "https://picsum.photos/200/308")!, types: [.comedy,.crime,.dystopian],
//                                     year: 2020, rating: "TV-MA",numberOfSeasons:3, episodes: episodes,promoText:"Watch Season 3 Now", defaultEpisodeInfo: CurrentEpisodeInfo(episodeName: "Begining and Ending", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", season: 2, episode: 1),cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",creators:"Baran bo Odan, Jantje Friese",moreLike: movielikeThis,trailers: trailersData))
        }
    }
}
let trailersData = [Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/344")!),
                Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/342")!),
                Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/343")!),
                Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/345")!),
                Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/346")!),
                Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/347")!),
                Trailer(name: "Season 3: Dark", videoURL: exampleVideoURL, thumbnailImageURL: URL(string: "https://picsum.photos/200/348")!)]
