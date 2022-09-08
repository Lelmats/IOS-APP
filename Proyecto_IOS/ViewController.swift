//
//  ViewController.swift
//  Proyecto_IOS
//
//  Created by Alumno on 9/6/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var reproductor: AVAudioPlayer?
    

    @IBOutlet weak var lblLabelDogos: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try
                AVAudioSession.sharedInstance().setActive(true)
        }
        catch let error {
            print(error.localizedDescription)
        }
        
    }


    @IBAction func DoTapDOGO(_ sender: Any) {
        
        lblLabelDogos.text = "Prueba"
        do {
            let url = Bundle.main.url(forResource: "uff", withExtension: "mp3")
            
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            
            reproductor?.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
        
    }
}

