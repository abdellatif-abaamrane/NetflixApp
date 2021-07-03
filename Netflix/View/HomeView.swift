//
//  HomeView.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI
enum TopBar: String, CaseIterable {
    case home = "Home"
    case tvshow = "TV Shows"
    case movies = "Movies"
    case mylist = "My List"

}
struct HomeView: View {
    @StateObject var homeVM = HomeVM()
    let screen = UIScreen.main.bounds
    @State var detailViewIsPresented = false
    @State var selectedTopBar : TopBar = .home
    @State var itemTopBarSelected = false
    @Namespace var space
    init() {
       UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ZStack(alignment:.top) {
            Color.black.edgesIgnoringSafeArea(.all )
            ScrollView(.vertical, showsIndicators: false, content: {
                TopMoviePreview(movie: Movie(name: "TRAVELERS", thumbnailURL: URL(string: "https://picsum.photos/200/313")!, types: [.comedy,.crime,.horror],year: 2020, rating: "TV-MA", defaultEpisodeInfo: CurrentEpisodeInfo(episodeName: "Begining and Ending", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", season: 2, episode: 1),cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",creators:"Baran bo Odan, Jantje Friese")).edgesIgnoringSafeArea(.top)
                LazyVStack(alignment: .leading) {
                    ForEach(Category.allCases,id:\.self) { category in
                        if let movies = homeVM.movies[category] {
                            Text(category.description)
                                .bold()
                                .font(.title)
                                .padding(10)
                                .foregroundColor(.white)
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHStack {
                                    ForEach(movies,id:\.id) { movie in
                                        StandardHomeMovie(movie: movie).onTapGesture(perform: {
                                            print(movie.numberOFSeasonsDisplay)
                                            detailViewIsPresented.toggle()
                                        }).fullScreenCover(isPresented: $detailViewIsPresented) { MovieDetail(movie: movie)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }).edgesIgnoringSafeArea(.top)
            HStack(spacing: 20) {
                    Button(action: {
                        selectedTopBar = .home
                    }, label: {
                        Image("netflix_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                    })
                
                    if selectedTopBar == .home {
                        HStack {
                            ForEach(TopBar.allCases,id:\.self) { type in
                                if type != .home {
                                    Button(action: {
                                        selectedTopBar = type
                                    }, label: {
                                        Text(type.rawValue).bold().foregroundColor(.white).font(.title2)
                                    })
                                }
                            }
                        }.transition(.opacity.combined(with: AnyTransition.offset(x: 0, y: 0)).combined(with: AnyTransition.scale(scale: 0, anchor: .leading)).animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0.4)))
                    } else {
                        HStack {
                            Button(action: {
                                itemTopBarSelected.toggle()
                            }, label: {
                                HStack(spacing:5) {
                                    Text(selectedTopBar.rawValue).bold().foregroundColor(.white).font(.title2)
                                    Image(systemName: "triangle.fill").imageScale(.small).font(.caption2)
                                        .foregroundColor(.white).rotationEffect(Angle(degrees: 180))
                                }
                                
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack(spacing:5) {
                                    Text("All Genre").bold().foregroundColor(.white).font(.title3)
                                    Image(systemName: "triangle.fill").imageScale(.small).font(.caption2)
                                        .foregroundColor(.white).rotationEffect(Angle(degrees: 180))
                                }
                                
                            })
                            
                        }.transition(.opacity.combined(with: AnyTransition.offset(x: 0, y: 0)).combined(with: AnyTransition.scale(scale: 0, anchor: .leading)).animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0.4)))
                    }

                    Spacer()
                }.frame(maxWidth: .greatestFiniteMagnitude,alignment: .top)
            TabTopPicker(isShow: $itemTopBarSelected, selectedItem: $selectedTopBar).scaleEffect(itemTopBarSelected ? CGSize(width: 1.0, height: 1.0):.zero, anchor: .bottom)
                .rotation3DEffect(
                    itemTopBarSelected ? .zero : Angle(degrees: 40),
                    axis: (x: 10.0, y: 10.0, z: 10.0)
                )
                .opacity(itemTopBarSelected ? 1 : 0)
                .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0.4)).allowsHitTesting(itemTopBarSelected ? true:false).edgesIgnoringSafeArea(.all)
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
