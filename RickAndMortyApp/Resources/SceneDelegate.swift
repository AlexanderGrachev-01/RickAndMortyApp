//
//  SceneDelegate.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = RMTabBarController()
        window?.makeKeyAndVisible()
    }
}
