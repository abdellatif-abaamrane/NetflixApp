//
//  VideoView.swift
//  Netflix
//
//  Created by ********* on 01/06/2020.
//

import SwiftUI
import AVKit


struct VideoView: View {
    let url : URL
    var body: some View {
        makeVideoPlayer()
    }
    func makeVideoPlayer() -> VideoPlayer<EmptyView> {
        let item = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: item)
        return VideoPlayer(player: player)
    }
}
