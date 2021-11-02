//
//  NowPlaying3ViewController.swift
//  AudioPlayerObservers
//
//  Created by Luu Tran on 02/11/2021.
//

import Foundation
import UIKit
import AudioPlayerObserverClosures

class NowPlaying3ViewController: UIViewController {
  
  let titleLabel: UILabel = UILabel()
  let durationLabel: UILabel = UILabel()
  let player: AudioPlayer = AudioPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("NowPlaying3ViewController")
    player.addPlaybackStartedObserver(self) { vc, player, item in
      print("addPlaybackStartedObserver callback")
      vc.titleLabel.text = item.title
      vc.durationLabel.text = "\(item.duration)"
    }
    player.addPlaybackPausedObserver(self) { vc, player, Item in
      print("addPlaybackPausedObserver callback")
    }
    player.addPlaybackStoppedObserver(self) { vc, player in
      print("addPlaybackStoppedObserver callback")
    }
    player.play(AudioPlayer.Item(title: "Hello", duration: 100))
    player.pause()
    player.stop()
  }
}
