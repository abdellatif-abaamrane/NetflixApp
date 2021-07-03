//
//  StandardHomeMovie.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    var movie : Movie
    @ScaledMetric var size : CGFloat = 100
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .frame(width: 140, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)

            Text(movie.name)
                .bold()
                .fontWeight(.black)
                .font(.headline)
                .padding([.bottom,.leading],10)
                .foregroundColor(.white)
                

        }
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: Movie(name: "DARK",
                                       thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                                       types: [.comedy,.crime,.dystopian],
                                       year: 2020,
                                       rating: "TV-MA",
                                       defaultEpisodeInfo: CurrentEpisodeInfo(
                                        episodeName: "Begining and Ending",
                                        description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.",
                                        season: 2,
                                        episode: 1),
                                       cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                                       creators:"Baran bo Odan, Jantje Friese"))
    }
}
