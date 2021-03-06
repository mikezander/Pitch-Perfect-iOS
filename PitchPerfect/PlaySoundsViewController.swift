//  PitchPerfect
//  PlaySoundsViewController.swift
//  Created by Michael Alexander on 5/9/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var revertButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //Required variables for extension PlaySoundsViewController: AVAudioPlayerDelegate
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
   
    let soundValues: Array<Float> = [0.5, 1.5, 1000, -1000];
    
    //Enum for differnet playback sounds. The integer matches the buttons tag in storyboard
    enum ButtonType: Int{ case slow = 0, fast = 1, chipmunk = 2, vader = 3, echo = 4, reverb = 5}
    
    //Switch to playsound according to which button was pressed
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: soundValues[ButtonType.slow.rawValue])
        case .fast:
            playSound(rate: soundValues[ButtonType.fast.rawValue])
        case .chipmunk:
            playSound(pitch: soundValues[ButtonType.chipmunk.rawValue])
        case .vader:
            playSound(pitch: soundValues[ButtonType.vader.rawValue])
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing) //initiate sound playback
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
 

}
