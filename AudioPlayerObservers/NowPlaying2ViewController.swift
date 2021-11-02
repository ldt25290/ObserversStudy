//
//  NowPlaying2ViewController.swift
//  AudioPlayerObservers
//
//  Created by Luu Tran on 02/11/2021.
//

import UIKit
import AudioPlayerObserverProtocols

class NowPlaying2ViewController: UIViewController {
  
  let titleLabel: UILabel = UILabel()
  
  let durationLabel: UILabel = UILabel()
  
  let player = AudioPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    player.addObserver(self)
    player.play(AudioPlayer.Item(title: "Hello", duration: 300))
    player.pause()
    player.stop()
  }
  
}

extension NowPlaying2ViewController: AudioPlayerObserver {
  func audioPlayer(_ player: AudioPlayer,
                   didStartPlaying item: AudioPlayer.Item) {
    print("NowPlaying2ViewController#didStartPlaying item \(item)")
    titleLabel.text = item.title
    durationLabel.text = "\(item.duration)"
  }
}
