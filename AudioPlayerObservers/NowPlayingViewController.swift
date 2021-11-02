//
//  NowPlayingViewController.swift
//  AudioPlayerObservers
//
//  Created by Luu Tran on 02/11/2021.
//

import UIKit
import AudioPlayerObserverNotification

class NowPlayingViewController: UIViewController {
  
  private let notificationCenter: NotificationCenter = NotificationCenter()
  
  let titleLabel: UILabel = UILabel()
  
  let durationLabel: UILabel = UILabel()
  
  lazy var player = AudioPlayer(notificationCenter: notificationCenter)
  
  deinit {
    // If your app supports iOS 8 or earlier, you need to manually
    // remove the observer from the center. In later versions
    // this is done automatically.
    notificationCenter.removeObserver(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    notificationCenter.addObserver(self,
                                   selector: #selector(playbackDidStart),
                                   name: .playbackStarted,
                                   object: nil
    )
    player.play(AudioPlayer.Item(title: "Hello", duration: 300))
    player.pause()
    player.stop()
  }
  
  @objc private func playbackDidStart(_ notification: Notification) {
    guard let item = notification.object as? AudioPlayer.Item else {
      let object = notification.object as Any
      assertionFailure("Invalid object: \(object)")
      return
    }
    print("NowPlayingViewController#playbackDidStart item \(item)")
    titleLabel.text = item.title
    durationLabel.text = "\(item.duration)"
  }
}
