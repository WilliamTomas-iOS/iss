//
//  SecondViewController.swift
//  ISS
//
//  Created by William Tomas on 29/10/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import UIKit
import AVKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playStream() {
        let videoURL = URL(fileURLWithPath: Constants.stream.url)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }

}

