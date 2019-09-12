//
//  AudioPlayerComposition.swift
//  avfoundation-avaudioplayer-power-visualizer
//
//  Created by Maxim Vialyx on 9/12/19.
//  Copyright © 2019 Maxim Vialyx. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerComposition {

    private var player: AVAudioPlayer
    private weak var view: AudioPowerVisualizerView!

    init(player: AVAudioPlayer, view: AudioPowerVisualizerView) {
        self.player = player
        self.view = view
        player.isMeteringEnabled = true
        view.player = player
    }

    // Start audio playing, view updates
    func play() {
        guard !player.isPlaying else {
            return
        }

        player.play()
        view.start()
    }

    // Pause audio playing, stop view updates
    func pause() {
        guard player.isPlaying else {
            return
        }

        player.pause()
        view.stop()
    }

    // Stop audio playing, stop view updates
    func stop() {
        guard player.isPlaying else {
            return
        }

        player.stop()
        view.stop()
    }

}
