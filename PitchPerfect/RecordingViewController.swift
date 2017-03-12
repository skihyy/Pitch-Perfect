//
//  RecordingViewController.swift
//  PitchPerfect
//
//  Created by Yuyang He on 2017/3/12.
//  Copyright © 2017年 YuyangHe. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingViewController: UIViewController {
    
    var audioRecorder : AVAudioRecorder!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    let startHint = "Tab to Record", stopHint = "Recoding..."

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordButton.isEnabled = false
    }
    
    @IBAction func startRecording(_ sender: Any) {
        stopRecordButton.isEnabled = true
        recordButton.isEnabled = false
        hintLabel.text = stopHint
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        print(filePath ?? "null")
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
        hintLabel.text = startHint
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}

