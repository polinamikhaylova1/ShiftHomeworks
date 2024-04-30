//
//  ViewController.swift
//  businessCard
//
//  Created by Полина Михайлова on 28.04.2024.
//

import UIKit

class BioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func buttonPressed( _ sender: Any){
        let devInfoVC = DevInfoViewController()
        present(devInfoVC,animated: true, completion: nil)
        
    }

    @IBAction func button2Pressed(_ sender: UIButton) {
        let hobbyVC = HobbyInfoViewController()
        present(hobbyVC,animated: true, completion: nil)
        
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}

