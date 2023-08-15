//
//  SceneDelegate.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 14.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let firstStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let firstViewController = firstStoryboard.instantiateInitialViewController()
        let navController = UINavigationController(rootViewController: firstViewController!)
        navController.tabBarItem = UITabBarItem(title: "Petition 1", image: UIImage(systemName: "person.fill"), tag: 0)
        return navController
    }
    
    func createSecondNavigationController() -> UINavigationController {
        let secondStoryboard = UIStoryboard(name: "Second", bundle: nil)
        let secondViewController = secondStoryboard.instantiateInitialViewController()
        let navController1 = UINavigationController(rootViewController: secondViewController!)
        navController1.tabBarItem = UITabBarItem(title: "Petition 2", image: UIImage(systemName: "person.fill"), tag: 1)
        return navController1
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemCyan
        tabBar.viewControllers = [createHomeNavigationController(), createSecondNavigationController()]
        tabBar.tabBar.backgroundColor = .systemBackground
        return tabBar
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
