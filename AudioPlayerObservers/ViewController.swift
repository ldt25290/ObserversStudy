//
//  ViewController.swift
//  AudioPlayerObservers
//
//  Created by Luu Tran on 02/11/2021.
//

import UIKit
import AudioPlayerObserverNotification

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let vc1 = NowPlayingViewController()
    self.view.addSubview(vc1.view)
    let vc2 = NowPlaying2ViewController()
    self.view.addSubview(vc2.view)
    let vc3 = NowPlaying3ViewController()
    self.view.addSubview(vc3.view)
  }

}
