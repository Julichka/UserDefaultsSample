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
    
    let imageNameKey: String = "imageNameKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UserDefaults.standard.set(lightImageName, forKey: imageNameKey)
        image.image = UIImage(named: lightImageName)
    }


}

