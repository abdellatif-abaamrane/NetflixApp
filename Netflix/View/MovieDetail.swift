//
//  MovieDetail.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI
import Kingfisher
enum ButtonType {
    case myList
    case rated
    case share
    var icon : String {
        switch self {
        case .myList:
            return  "checkmark"
        case .rated:
            return  "hand.thumbsup.fill"
        case .share:
            return "paperplane"
        }
    }
    var title : String {
        switch self {
        case .myList:
           return "My List"
        case .rated:
            return "Rated"
        case .share:
            return "Share"
        }
    }
}
enum TabBarType: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
    
}
struct MovieDetail: View {
    let movie : Movie
    let screen = UIScreen.main.bounds
    @State var currentTab = TabBarType.episodes
    @State var selectedSeason = 1
    @State var pickerIsShow = false
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                LazyVStack(alignment:.leading) {
                    TopDetailView(movie: movie)
                    SwitcherView(selectedTab: $currentTab)
                    switch currentTab {
                    case .episodes:
                        Button(action: {
                            
                                pickerIsShow.toggle()
                        }, label: {
                            HStack {
                                Text("Season \(selectedSeason)").bold()
                                Image(systemName: "chevron.down")
                            }
                            
                        }).foregroundColor(.gray).font(.title2).padding()
                        EpisodesView(movie: movie, selectedSeason: $selectedSeason)
                            .transition(.move(edge: .bottom)
                                            .combined(with: .opacity).combined(with: AnyTransition.scale(scale: 0, anchor: .bottom)))
                            .animation(.spring())

                    case .trailers:
                        TrailersThisView(movie: movie)
                            .transition(.move(edge: .bottom)
                                            .combined(with: .opacity).combined(with: AnyTransition.scale(scale: 0, anchor: .bottom)))
                            .animation(.spring())
                    case .more:
                       LikeThisView(movie: movie)
                        .transition(.move(edge: .bottom)
                                        .combined(with: .opacity).combined(with: AnyTransition.scale(scale: 0, anchor: .bottom)))
                        .animation(.spring())
                    }
                }
            }).edgesIgnoringSafeArea(.all)
            PickerViewSeason(movie: movie, selectedSeason: $selectedSeason,isShow:$pickerIsShow)
                .scaleEffect(pickerIsShow ? CGSize(width: 1.0, height: 1.0):.zero, anchor: .bottom)
                .rotation3DEffect(
                    pickerIsShow ? .zero : Angle(degrees: 40),
                    axis: (x: 10.0, y: 10.0, z: 10.0)
                )
                .opacity(pickerIsShow ? 1 : 0)
                .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0.4)).allowsHitTesting(pickerIsShow ? true:false).edgesIgnoringSafeArea(.all)
        }
    }
}

struct BlurView : UIViewRepresentable {
    let style : UIBlurEffect.Style
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let blur = UIBlurEffect(style: style)
        
        let effectView = UIVisualEffectView(effect: blur)
        return effectView
    }
    
    
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(name: "ALONE",
                                 thumbnailURL: URL(string: "https://picsum.photos/200/308")!, types: [.comedy,.crime,.dystopian],
                                 year: 2020, rating: "TV-MA",numberOfSeasons:3, episodes: episodes,promoText:"Watch Season 3 Now", defaultEpisodeInfo: CurrentEpisodeInfo(episodeName: "Begining and Ending", description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum.", season: 2, episode: 1),cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",creators:"Baran bo Odan, Jantje Friese",
                                 moreLike: movielikeThis,
                                 trailers: trailersData))
    }
}

struct EpisodesView: View {
    var movie : Movie
    let screen = UIScreen.main.bounds
    @Binding var selectedSeason : Int
    var body: some View {
        if let episodes = movie.episodes {
            ForEach(episodes
                        .filter({ $0.season == selectedSeason })
                        .sorted(by: { $0.episodeNumber < $1.episodeNumber }),
                    id: \.id) { episode in
                EpisodeView(episode: episode)
            }
        }
    }
}

struct LikeThisView: View {
    var movie : Movie
    let screen = UIScreen.main.bounds
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())],
                  alignment: .center,
                  spacing: nil,
                  pinnedViews: []) {
            if let movies = movie.moreLike {
                ForEach(movies,id:\.id) { movie in
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .frame(width: screen.width/3-8,height: 200)
                }
            }
        }
    }
}
struct TrailersThisView: View {
    var movie : Movie
    let screen = UIScreen.main.bounds
    var body: some View {
        if let trailers = movie.trailers {
            ForEach(trailers, id: \.id) { trailer in
                VStack(alignment:.leading) {
                    ZStack {
                        KFImage(trailer.thumbnailImageURL)
                            .resizable()
                            .frame(width:screen.width,
                                   height: 300)
                            .aspectRatio(contentMode: .fit)

                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "play.fill").imageScale(.large).font(.system(size: 33, weight: .regular, design: .rounded))
                                .foregroundColor(.white).padding(20).background(Circle().strokeBorder(Color.white, lineWidth: 4).background(Circle().fill(Color.black.opacity(0.4))))
                        })
                    }
                    Text(trailer.name)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding([.leading],13)
                }
            }
            
        }
    }
}

struct TopDetailView: View {
    var movie : Movie
    var screen = UIScreen.main.bounds
    @Environment(\.presentationMode) var dismiss
    @State var selectedButton : ButtonType = .myList
    var body: some View {
        ZStack {
            Group {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width,height: screen.height-90)
                BlurView(style: .dark)
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.7))
            }.compositingGroup()
            VStack(spacing:10) {
                HStack {
                    Button(action: {
                        dismiss.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.white)
                            .imageScale(.medium)
                            .padding(8)
                            .background(Circle().fill(Color(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 35.0/255.0, alpha: 1.0))))
                            .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    }).padding(.leading,20)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.white)
                            .imageScale(.medium)
                            .padding(8)
                            .background(Circle().fill(Color(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 35.0/255.0, alpha: 1.0))))
                            .offset(x: 0, y: 20)
                            .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)

                    }).padding(.trailing,20)
                }
                KFImage(movie.thumbnailURL).resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width/2)
                    .shadow(color: .black, radius: 10, x: 0.0, y:0.0)
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "hand.thumbsup.fill")
                    }).foregroundColor(.white)
                    Label(
                        title: { Text(String(movie.year)).bold() },
                        icon: {  }).foregroundColor(.gray).padding(5)
                    Label(
                        title: { Text(movie.rating).bold() },
                        icon: {  }).padding(5)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 3)
                                        .foregroundColor(Color.gray))
                    Label(
                        title: { Text(movie.numberOFSeasonsDisplay).bold() },
                        icon: {  })
                        .foregroundColor(.gray)
                        .padding(5)
                    Label(
                        title: { Text("HD").bold() },
                        icon: {  })
                        .foregroundColor(.gray)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 3)
                                        .strokeBorder(Color.gray, lineWidth: 1.4, antialiased: true).foregroundColor(.clear))
                }
                
                if let promoText = movie.promoText {
                    Text(promoText)
                        .font(.headline)
                        .fontWeight(.black)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                
                
                Button(action: {}, label: {
                    HStack {
                        Spacer()
                        Image(systemName: "play.fill")
                            .imageScale(.large)
                        Text("Play")
                            .bold()
                        Spacer()
                        
                    }.foregroundColor(.white)
                    
                }).padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .background(Color.red)
                .cornerRadius(5)
                .padding([.trailing,.leading], 10)
                Text("S\(movie.currentEpisodeInfo.season).E\(movie.currentEpisodeInfo.episode) \(movie.currentEpisodeInfo.episodeName)")
                    .font(.headline)
                    .fontWeight(.black)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .frame(maxWidth:.greatestFiniteMagnitude, alignment: .leading)
                    .padding([.trailing,.leading], 10)
                Text(movie.currentEpisodeInfo.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(maxWidth:.greatestFiniteMagnitude, alignment: .leading)
                    .padding([.trailing,.leading], 10)
                Group {
                    Text("Cast: \(movie.cast)").bold()
                    Text("Creators: \(movie.creators)").bold()
                }.font(.callout)
                .foregroundColor(.gray)
                .frame(maxWidth:.greatestFiniteMagnitude, alignment: .leading)
                .padding([.trailing,.leading], 10)
                ReactView()
                
            }.padding(.top, 50)
        }
    }
}

struct SwitcherView: View {
    var tabs = [TabBarType.episodes,.trailers,.more]
    @Binding var selectedTab : TabBarType
    var body: some View {
        HStack(spacing:8) {
            ForEach(tabs,id:\.self) { tab in
                Button(action: {
                    selectedTab = tab
                }, label: {
                    VStack(alignment:.leading) {
                        Rectangle()
                            .fill(selectedTab == tab ? Color.red : .clear)
                            .frame(height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .animation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4))
                        Text(tab.rawValue).fontWeight(selectedTab == tab ? .black : .regular).font(.headline).foregroundColor(.white)
                            .animation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4))
                    }.fixedSize()
                })
                
            }
            Spacer()
        }.padding(.all, 10)
    }
}

struct ReactView: View {
    var buttons = [ButtonType.myList,.rated,.share]
    @State var selectedButton = ButtonType.myList
    var body: some View {
        HStack {
            ForEach(buttons,id: \.self) { button in
                Button(action: {
                    selectedButton = button
                }, label: {
                    VStack(spacing:15) {
                        Image(systemName: button.icon).frame(width: 40, height: 40, alignment: .center)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text(button.title)
                            .bold()
                            .font(.headline)
                            .foregroundColor(.gray)
                        RoundedRectangle(cornerRadius: 1)
                            .fill( selectedButton == button ? Color.red : Color.clear)
                            .scaleEffect(CGSize(width: selectedButton == button ? 1.0:0, height: 1.0),anchor: .leading)
                            .frame(height: 6, alignment: .center)
                            .animation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4))
                    }
                }).frame(width: 100, alignment: .center)
            }
            
            Spacer()
            
        }.padding(.leading, 10)
    }
}
