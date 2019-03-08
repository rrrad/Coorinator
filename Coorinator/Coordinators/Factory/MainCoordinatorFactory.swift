//
//  MainCoordinatorFactory.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 24/02/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

protocol MainCoordinatorFactoryProtocol {
    func makeViewControllers() -> [UINavigationController]
    func makeCoordinators() -> [Coordinable]
}

class MainCoordinatorFactory: MainCoordinatorFactoryProtocol {
    private var controllers: [UINavigationController] = []
    
    func makeViewControllers() -> [UINavigationController] {
        if controllers.count == 0 {
        let vc1 = UIViewController()
        let nav1 = UINavigationController.init(rootViewController: vc1)
        nav1.tabBarItem.title = "Feed"
        controllers.append(nav1)

        let vc2 = UIViewController()
        let nav2 = UINavigationController.init(rootViewController: vc2)
        nav2.tabBarItem.title = "Profile"
        controllers.append(nav2)
        }
        return controllers
    }
    
    func makeCoordinators() -> [Coordinable] {
        if controllers.count == 0 {
            return []
        } else {
        let coordinator1 = FeedCoordinator.init(name: "Feed", root: controllers[0])
        let coordinator2 = ProfileCoordinator.init(name: "Profile", root: controllers[1])
            return [coordinator1, coordinator2]
        }
    }
    
}
