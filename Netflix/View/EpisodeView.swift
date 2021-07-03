//
//  EpisodeView.swift
//  Netflix
//
//  Created by ********* on 01/06/2020.
//

import SwiftUI
import Kingfisher


struct EpisodeView: View {
    let episode : Episode
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    KFImage(URL(string: episode.thumbnailImageURLString)!)
                        .resizable()
                        .frame(width:140,
                               height: 90)
                        .aspectRatio(contentMode: .fit)
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "play.fill").imageScale(.medium).font(.system(size: 18, weight: .regular, design: .rounded))
                            .foregroundColor(.white).padding(10).background(Circle().strokeBorder(Color.white, lineWidth: 2).background(Circle().fill(Color.black.opacity(0.4))))
                    })
                }
                VStack(alignment:.leading) {
                    Text("\(episode.episodeNumber). \(episode.name)").bold().foregroundColor(.white)
                    Text("\(episode.duration) min").font(.caption).bold().foregroundColor(.gray)
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "arrow.down.to.line.alt").imageScale(.large).font(.system(size: 24, weight: .semibold, design: .monospaced)).foregroundColor(.white)
                })
            }
            Text(episode.description).foregroundColor(.white)
        }.padding([.leading,.trailing],10)
    }
    
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episode:episodes[0])
        
    }
}
