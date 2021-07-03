//
//  PickerSeason.swift
//  Netflix
//
//  Created by ********* on 01/06/2020.
//

import SwiftUI

struct PickerViewSeason: View {
    let movie : Movie
    @Binding var selectedSeason : Int
    @Binding var isShow : Bool

    var body: some View {
        ZStack {
            BlurView(style: .dark).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack(spacing:20) {
                    if let numberOfSeasons = movie.numberOfSeasons {
                        ForEach((0..<numberOfSeasons)) { season in
                            Button(action: {
                                selectedSeason = season+1
                                isShow.toggle()
                            }, label: {
                                Text("Season \(season+1)")
                            }).foregroundColor((selectedSeason == season+1) ? .white:.gray)
                            .font(.system(size: 30,
                                          weight: (selectedSeason == season+1) ? .black:.regular,
                                          design: .monospaced))
                            .scaleEffect((selectedSeason == season+1) ? 1:0.9)
                            .animation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4))
                        }
                    } else {
                        Text("Season 1")
                    }
                }
                
                Spacer()
                Button(action: {
                        isShow.toggle()
                }, label: {
                    Image(systemName: "xmark").font(.system(size: 33, weight: .bold, design: .monospaced))
                }).foregroundColor(.black).padding().background(Circle().fill(Color.white)).padding([.bottom],50)
            }.font(.largeTitle).foregroundColor(.gray)
        }
        
    }
}
struct TabTopPicker: View {
    let topBarItems = TopBar.allCases
    @Binding var isShow : Bool
    @Binding var selectedItem : TopBar
    var body: some View {
        ZStack {
            BlurView(style: .dark).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack(spacing:20) {
                    ForEach(topBarItems,id:\.self) { item in
                        Button(action: {
                            selectedItem = item
                            isShow.toggle()
                        }, label: {
                            Text(item.rawValue)
                        }).foregroundColor((selectedItem == item) ? .white:.gray)
                        .font(.system(size: 30,
                                      weight: (selectedItem == item) ? .black:.regular,
                                      design: .monospaced))
                        .scaleEffect((selectedItem == item) ? 1:0.9)
                        .animation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4))
                    }
                    
                }
                
                Spacer()
                Button(action: {
                        isShow.toggle()
                }, label: {
                    Image(systemName: "xmark").font(.system(size: 33, weight: .bold, design: .monospaced))
                }).foregroundColor(.black).padding().background(Circle().fill(Color.white)).padding([.bottom],50)
            }.font(.largeTitle).foregroundColor(.gray)
        }
        
    }
}
struct PickerSeason_Previews: PreviewProvider {
    static var previews: some View {
        PickerViewSeason(movie: Movie(name: "ALONE",
                                      thumbnailURL: URL(string: "https://picsum.photos/200/308")!, types: [.comedy,.crime,.dystopian],
                                      year: 2020, rating: "TV-MA",numberOfSeasons:3, episodes: episodes,promoText:"Watch Season 3 Now", defaultEpisodeInfo: CurrentEpisodeInfo(episodeName: "Begining and Ending", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", season: 2, episode: 1),cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",creators:"Baran bo Odan, Jantje Friese",
                                      moreLike: movielikeThis,
                                      trailers: trailersData),selectedSeason:.constant(1), isShow: .constant(true))
    }
}
