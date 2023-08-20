//
//  MusicPlayer.swift
//  MewMath
//
//  Created by Rizky Dwi Hadisaputro on 14/04/23.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var player: AVAudioPlayer?
    
    func startBackgroundMusic() {
        if let path = Bundle.main.path(forResource: "copycat", ofType: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.numberOfLoops = -1 // Infinite loop
                player?.play()
            } catch {
                print("Could not find the music file.")
            }
        }
    }
    
    func stopBackgroundMusic() {
        player?.stop()
        player = nil
    }
}
