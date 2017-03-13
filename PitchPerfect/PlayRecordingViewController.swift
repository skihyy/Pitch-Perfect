//
//  PlayRecordingViewController.swift
//  PitchPerfect
//
//  Created by Yuyang He on 2017/3/12.
//  Copyright © 2017年 YuyangHe. All rights reserved.
//

import UIKit
import AVFoundation

class PlayRecordingViewController: UIViewController {
    
    var recordedAudioURL: URL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
    enum ButtonType : Int {case slow = 0, fast, lowPitch, highPitch, reverb, echo}
    
    @IBOutlet weak var slowButton : UIButton!
    @IBOutlet weak var fastButton : UIButton!
    @IBOutlet weak var lowPitchButton : UIButton!
    @IBOutlet weak var highPitchButton : UIButton!
    @IBOutlet weak var echoButton : UIButton!
    @IBOutlet weak var reverbButton : UIButton!
    @IBOutlet weak var stopButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSound(_ sender : UIButton)
    {
        print("play")
    }
    
    @IBAction func stopPlaySound(_ sender : UIButton)
    {
        print("stop")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
