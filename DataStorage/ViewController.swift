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
    
    let image2: String = "light"
    let image1: String = "dark"
    
    let lightBackColor = UIColor.white
    let darkBackColor = UIColor.black
    
    let imageNameKey: String = "imageNameKey"
    let isBackgroundDarkKey: String = "isBackgroundDarkKey"
    
    let defaults: UserDefaults = UserDefaults.standard
    
    @IBAction func onSwitched(_ sender: Any) {
        if switcher.isOn {
            defaults.set(image2, forKey: imageNameKey)
            defaults.set(true, forKey: isBackgroundDarkKey)
        } else {
            defaults.set(image1, forKey: imageNameKey)
            defaults.set(false, forKey: isBackgroundDarkKey)
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
            savedFileName = image1
            defaults.set(savedFileName, forKey: imageNameKey)
        }
        
        image.image = UIImage(named: savedFileName ?? image1)
        
        if (defaults.bool(forKey: isBackgroundDarkKey)) {
            self.view.backgroundColor = darkBackColor
        } else {
            self.view.backgroundColor = lightBackColor
        }
    }
}

