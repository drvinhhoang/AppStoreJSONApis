//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by VINH HOANG on 02/01/2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", imageName: "todayIcon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Search", imageName: "search")
        ]
    }
    
   
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String)-> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
    
}



