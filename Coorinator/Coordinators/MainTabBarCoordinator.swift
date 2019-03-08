//
//  MainTabBarCoordinator.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 02/03/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

protocol MainTabBarCoordinatorOutputProtocol {
    var finalBlock: (() -> Void)? {get set}
}

class MainTabBarCoordinator: BaseCoordinator, MainTabBarCoordinatorOutputProtocol {
    
    var finalBlock: (() -> Void)?
    
    fileprivate var name: String
    fileprivate var router: Routable?
    fileprivate var controllers: [UINavigationController]
    fileprivate var factory: MainCoordinatorFactoryProtocol
    
    fileprivate var tabBar: UITabBarController?
    
    init(name: String, root: UIViewController) {
        self.name = name
        router = Router(root)
        factory = MainCoordinatorFactory()
        controllers = factory.makeViewControllers()
        super.init()
        
        setCoordinators(factory.makeCoordinators())
        
        tabBar = UITabBarController.init()
        tabBar!.viewControllers = controllers
        
    }
}

extension MainTabBarCoordinator: Coordinable {
    var nameCoordinator: String {
        return name
    }
    
    func start() {
        router?.setRootModule(tabBar!)
    }
}


private extension MainTabBarCoordinator {
    func setCoordinators(_ coordinators: [Coordinable]) {
        coordinators.forEach {[weak self](coord) in
            self?.addDependency(coord)
            coord.start()
        }
    }
    
}

