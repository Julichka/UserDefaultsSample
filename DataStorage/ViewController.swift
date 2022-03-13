//
//  ViewController.swift
//  DataStorage
//
//  Created by Yuliia Khrupina on 3/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var switcher: UISwitch!
    
    let lightImageName: String = "light"
    let darkImageName: String = "dark"
    
    let lightBackColor = UIColor.white
    let darkBackColor = UIColor.black
    
    let imageNameKey: String = "imageNameKey"
    let isBackgroundLightKey: String = "isBackgroundLightKey"
    
    let defaults: UserDefaults = UserDefaults.standard
    
    @IBAction func onSwitched(_ sender: Any) {
        if switcher.isOn {
            defaults.set(lightImageName, forKey: imageNameKey)
            defaults.set(false, forKey: isBackgroundLightKey)
        } else {
            defaults.set(darkImageName, forKey: imageNameKey)
            defaults.set(true, forKey: isBackgroundLightKey)
        }
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        var savedFileName = defaults.string(forKey: imageNameKey)
        if (savedFileName == nil) {
            savedFileName = lightImageName
            defaults.set(savedFileName, forKey: imageNameKey)
        }
        
        image.image = UIImage(named: savedFileName ?? lightImageName)
        
        if (defaults.bool(forKey: isBackgroundLightKey)) {
            self.view.backgroundColor = lightBackColor
        } else {
            self.view.backgroundColor = darkBackColor
        }
    }
}

