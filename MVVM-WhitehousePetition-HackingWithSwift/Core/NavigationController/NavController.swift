//
//  NavController.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 14.08.2023.
//

import UIKit

class NavController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.standardAppearance = appearance
        navigationBar?.scrollEdgeAppearance = appearance
        navigationBar?.compactAppearance = appearance
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)
    }
}
