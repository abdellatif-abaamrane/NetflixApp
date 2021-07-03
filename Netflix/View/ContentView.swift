//
//  ContentView.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI

struct ContentView: View {
    init() {
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.backgroundColor = .black
        tabbarAppearance.selectionIndicatorTintColor = .white
        tabbarAppearance.stackedLayoutAppearance.selected.iconColor = .white
        tabbarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.white]
        UITabBar.appearance().standardAppearance = tabbarAppearance
    }
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
                    HomeView()
                        .tabItem {
                            VStack {
                                Image(systemName: "house").accentColor(.white)
                                Text("Home").accentColor(.white)
                            }
                        }
                        .tag(1)
                    SearchView()
                        .tabItem {
                            VStack {
                                Image(systemName: "magnifyingglass").accentColor(.white)
                                Text("Search").accentColor(.white)
                            }
                        }
                        .tag(2)
                    Text("Coming Soon")
                        .tabItem {
                            VStack {
                                Image(systemName: "plus.square.on.square").accentColor(.white)
                                Text("Coming Soon").accentColor(.white)
                            }
                        }
                        .tag(3)
                    Text("Coming Soon")
                        .tabItem {
                            VStack {
                                Image(systemName: "arrow.down.to.line.alt").accentColor(.white)
                                Text("Downloads").accentColor(.white)
                            }
                        }
                        .tag(4)
                    Text("Coming Soon")
                        .tabItem {
                            VStack {
                                Image(systemName: "line.horizontal.3").accentColor(.white)
                                Text("More").accentColor(.white)
                            }
                        }
                        .tag(4)
                }).background(Color.black)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
