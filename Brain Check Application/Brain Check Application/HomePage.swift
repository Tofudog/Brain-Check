//
//  ViewController.swift
//  Brain Check Application
//
//  Created by Leonardo Amato Regis de Farias on 12/11/25.
//

import UIKit

class HomePage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background-image")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
}

