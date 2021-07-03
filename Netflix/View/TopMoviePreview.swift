//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    let movie : Movie
    var body: some View {
        ZStack(alignment:.bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.85))
            VStack(spacing:15) {
                Text(movie.name).multilineTextAlignment(.center)
                    .font(.system(size: 60, weight: .black, design: .serif)).scaledToFit().foregroundColor(.white)
                makeText(types:movie.types).multilineTextAlignment(.center).foregroundColor(.white)

                HStack {
                    Spacer()
                    SmallVerticalButton()
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Group {
                                Image(systemName: "play.fill").imageScale(.large)
                                Text("Play").bold()
                            }.foregroundColor(.black)
                            
                        }.padding(EdgeInsets(top: 10,
                                             leading: 25,
                                             bottom: 10,
                                             trailing: 25))
                        .background(RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.white))
                    })
                    Spacer()

                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Group {
                                Image(systemName: "info.circle").imageScale(.large)
                                Text("Info").bold()
                            }.foregroundColor(.white)
                        }
                    })
                    Spacer()

                }
            }.frame(maxWidth: UIScreen.main.bounds.width).padding()
            
        }
        
        
        
    }
    func makeText(types: [MovieType]) -> some View {
        let types = types.map { $0.description }
        let texts = types.enumerated().compactMap { index,type -> Text in
            if index < types.count-1 {
                return Text(type)+Text(" • ").bold().foregroundColor(.green)
            } else {
                return Text(type)
            }
            
        }
        return texts.reduce(Text(""), +)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie:Movie(name: "ALONE",
                                    thumbnailURL: URL(string: "https://picsum.photos/200/308")!, types: [.comedy,.crime,.dystopian],year: 2020, rating: "TV-MA", defaultEpisodeInfo: CurrentEpisodeInfo(episodeName: "Begining and Ending", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", season: 2, episode: 1),cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",creators:"Baran bo Odan, Jantje Friese"))
    }
}
