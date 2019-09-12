//
//  ViewController.swift
//  avfoundation-avaudioplayer-power-visualizer
//
//  Created by Maxim Vialyx on 9/12/19.
//  Copyright © 2019 Maxim Vialyx. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var powerView: AudioPowerVisualizerView!
    private var player: AudioPlayerComposition!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get URL to resouce, create audioPlayer
        guard let url = Bundle.main.url(forResource: "track", withExtension: "mp3"),
            let audioPlayer = try? AVAudioPlayer(contentsOf: url) else {
            return
        }

        // Inject audioPlayer and powerView into composition to get smart control
        player = AudioPlayerComposition(player: audioPlayer, view: powerView)
        player.play()
    }

    // MARK: - Actions
    @IBAction func play(_ sender: Any) {
        player.play()
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }

    @IBAction func stop(_ sender: Any) {
        player.stop()
    }

}
