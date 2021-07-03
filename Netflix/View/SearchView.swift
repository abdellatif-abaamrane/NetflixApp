//
//  SearchView.swift
//  Netflix
//
//  Created by ********* on 01/06/2020.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @State var value : String = ""
    var movies = movielikeThis
    init() {
        

        UITableViewCell.appearance().selectionStyle = .none
        UITableView.appearance()
    }
    
    var body: some View {
        let valueBiding =  Binding<String> {
            return value
        } set: { newValue in
            value = newValue
            print(newValue)
        }

        
       return ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment:.leading,spacing:20) {
                TextSearchView(value: valueBiding)
                Text("Popular Searches")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                ScrollView {
                    LazyVStack(spacing:3) {
                        ForEach(movies,id:\.id) { movie in
                            HStack {
                                KFImage(movie.thumbnailURL)
                                    .resizable()
                                    .frame(width: 200, height: 100, alignment: .center)
                                Text(movie.name).foregroundColor(.gray)
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                    Image(systemName: "play.fill")
                                }).foregroundColor(.white)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct TextSearchView: View {
    @Binding var value : String
    var body: some View {
        HStack {
            HStack(spacing:4) {
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large).font(.system(size: 24, weight: .bold, design: .monospaced))
                        .foregroundColor(.gray)
                })
                ZStack(alignment:.leading) {
                    TextField("", text: $value).font(.system(.title, design: .rounded)).foregroundColor(.white)
                    if value.isEmpty {
                        Text("Search")
                            .allowsHitTesting(false)
                            .font(.title)
                            .padding(.leading, 1)
                            .foregroundColor(Color.gray)
                    } else {
                        HStack {
                            Spacer()
                            Button(action: {
                                value = ""
                            }, label: {
                                Image(systemName: "xmark").imageScale(.medium).font(.system(size: 14, weight: .bold, design: .default))
                            })
                            .foregroundColor(Color(UIColor(red: 52.0/255.0, green: 49.0/255.0, blue: 53.0/255.0, alpha: 1.0)))
                            .padding(6)
                            .background(Circle().fill(Color.gray))
                        }
                        
                    }
                }
            }.padding(9)
            .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(lineWidth: 2).foregroundColor(.gray))
            .background(RoundedRectangle(cornerRadius: 15.0).foregroundColor(Color(UIColor(red: 52.0/255.0, green: 49.0/255.0, blue: 53.0/255.0, alpha: 1.0))))
            .padding(.leading,5)
            Button(action: {
                value = ""
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }, label: {
                Text("Cancel").font(.system(.title2)).foregroundColor(.white)
            })
        }
    }
}
