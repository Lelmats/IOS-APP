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
    var reproductorBackground: AVAudioPlayer?

    @IBOutlet weak var imgShiba: UIImageView!
    @IBOutlet weak var imgHusky: UIImageView!
    @IBOutlet weak var imgCocker: UIImageView!
    
    @IBOutlet weak var imgPrincipal: UIImageView!
    
    @IBOutlet weak var lblLabelDogos: UILabel!
    
    var secuenciaShibaLadrando : [UIImage] = []
    var secuenciaHuskyLadrando : [UIImage] = []
    var secuenciaCockerLadrando : [UIImage] = []
    var secuenciaPerro : [UIImage] = []
    var secuenciaHusky : [UIImage] = []
    var secuenciaCocker : [UIImage] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch let error {
            print(error.localizedDescription)
        }
        
        for i in 1...5 {
            let imagen = UIImage(named: "ShibaIDLE\(i)")
            secuenciaPerro.append(imagen!)
        }
        for i in 1...5 {
            let imagen2 = UIImage(named: "huskyIDLE\(i)")
            secuenciaHusky.append(imagen2!)
        }
        for i in 1...5 {
            let imagen3 = UIImage(named: "Cocker\(i)")
            secuenciaCocker.append(imagen3!)
        }
        for i in 1...6 {
            let imagen4 = UIImage(named: "Shiba\(i)")
            secuenciaShibaLadrando.append(imagen4!)
        }
        for i in 1...7 {
            let imagen5 = UIImage(named: "Husky\(i)")
            secuenciaHuskyLadrando.append(imagen5!)
        }
        for i in 1...5 {
            let imagen6 = UIImage(named: "CockerIDLE\(i)")
             secuenciaCockerLadrando.append(imagen6!)
         }
        
        imgShiba.animationImages = secuenciaPerro
        imgShiba.animationDuration = 1.5
        imgShiba.startAnimating()
        
        imgHusky.animationImages = secuenciaHusky
        imgHusky.animationDuration = 1.5
        imgHusky.startAnimating()
        
        imgCocker.animationImages = secuenciaCocker
        imgCocker.animationDuration = 1.5
        imgCocker.startAnimating()
        
        imgPrincipal.animationDuration = 1.5
        do {
            let url = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "mp3")
            
            reproductorBackground = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            
            reproductorBackground?.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func DoTapHusky(_ sender: Any) {
        lblLabelDogos.text = "Husky"
        imgPrincipal.stopAnimating()
        imgPrincipal.animationImages = secuenciaHuskyLadrando
        imgPrincipal.startAnimating()
         do {
             let url = Bundle.main.url(forResource: "Huskysound", withExtension: "mp3")
             
             reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
             
             reproductor?.play()
         }
         catch let error {
             print(error.localizedDescription)
         }
    }
    

    @IBAction func DoTapDOGO(_ sender: Any) {
        lblLabelDogos.text = "Shiba"
        imgPrincipal.stopAnimating()
        imgPrincipal.animationImages = secuenciaShibaLadrando
        imgPrincipal.startAnimating()
        do {
            let url = Bundle.main.url(forResource: "Shibasound", withExtension: "mp3")
            
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            
            reproductor?.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func DoTapCocker(_ sender: Any) {
        lblLabelDogos.text = "Cocker"
        imgPrincipal.stopAnimating()
        imgPrincipal.animationImages = secuenciaCockerLadrando
        imgPrincipal.startAnimating()
        do {
            let url = Bundle.main.url(forResource: "Panecitosound", withExtension: "mp3")
            
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            
            reproductor?.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
}

