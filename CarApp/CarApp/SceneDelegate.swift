//
//  SceneDelegate.swift
//  CarApp
//
//  Created by Полина Михайлова on 27.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let carBrandsModel = CarBrandsModel()
        let carBrandsPresenter = CarBrandsPresenter(view: nil, model: carBrandsModel)
        let carBrandsViewController = CarBrandsViewController(presenter: carBrandsPresenter)
        
        
                
        let navigationController = UINavigationController(rootViewController: carBrandsViewController)
                
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

   

}

