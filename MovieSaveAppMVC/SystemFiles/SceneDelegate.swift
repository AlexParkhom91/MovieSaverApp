//
//  SceneDelegate.swift
//  MovieSaveAppMVC
//
//  Created by Александр Пархамович on 17.11.22.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            let view = MovieViewController()
            let initialNavigationController = UINavigationController(rootViewController: view)
             window.rootViewController = initialNavigationController
             window.makeKeyAndVisible()
            
            
        }

}
