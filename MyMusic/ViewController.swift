//
//  ViewController.swift
//  MyMusic
//
//  Created by Joe G on 10/07/20.
//  Copyright © 2020 Nusantarian. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var Play: UIButton!
    @IBOutlet weak var Stop: UIButton!
    
    private var _player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Stop.disable()
        guard let url = Bundle.main.url(forResource: "test_music", withExtension: "mp3") else {return}
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func playMusic(_sender: UIButton){
        guard let player = _player else {return}
        player.play()
        Play.disable()
        Stop.enable()
    }
    
    @IBAction func stopMusic(_sender: UIButton){
        guard let player = _player else {return}
        player.stop()
        Play.enable()
        Stop.disable()
    }
}


extension UIButton{
    func enable(){
        self.isEnabled = true
    }
    
    func disable(){
        self.isEnabled = false
    }
}

