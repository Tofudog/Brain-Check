//
//  ViewController.swift
//  Brain Check Application
//
//  Created by Leonardo Amato Regis de Farias on 12/11/25.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet var checkBrainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define background image for the home page
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background-image")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func clickButtonDown() {
        // The state of the button when it is "touched down on"
        let activeStateImage = UIImage(named: "check-button-active")
        self.checkBrainButton.setImage(activeStateImage, for: .normal)
    }
    
    @IBAction func clickButtonUp() {
        // The state of the button when it is "touched up from down"
        let inactiveStateImage = UIImage(named: "check-button-inactive")
        self.checkBrainButton.setImage(inactiveStateImage, for: .normal)
    }
}

