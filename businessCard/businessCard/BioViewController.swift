//
//  ViewController.swift
//  businessCard
//
//  Created by Полина Михайлова on 28.04.2024.
//

import UIKit

class BioViewController: UIViewController {

    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "я")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let nameLabel = TextSettings.makeTitle(withText: "Полина Михайлова")
    
    let bioLabel = TextSettings.makeLabelHobbyDescripption(withText: "19 лет\nРодилась в г.Волжский, Волгоградская область\nСейчас живу и учусь в Новосибирске\nОбразование: НГУ, ММФ, 2022-2026)")
    private lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.alignment = .center
            stackView.distribution = .equalCentering
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
        addSubviews()
        constraintView()
    }
        
    func addSubviews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(bioLabel)
    }
        
    func constraintView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100 ),
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 250),
        ])
    }
    
}

