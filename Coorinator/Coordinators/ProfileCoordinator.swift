//
//  ProfileCoordinator.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 03/03/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit
protocol ProfileCoordinatorOutputProtocol {
    var finalBlock: (() -> Void)? {get set}
}

final class ProfileCoordinator: ProfileCoordinatorOutputProtocol{
    
    var finalBlock: (() -> Void)?
    
    fileprivate var router: Routable
    fileprivate var name: String
    fileprivate var factory: ProfileCoordinatorFactoryProtocol
    
    init(name: String, root: UINavigationController) {
        self.name = name
        self.router = RouterForNavigation.init(root)
        self.factory = ProfileCoordinatorFactory()
    }
}

extension ProfileCoordinator: Coordinable{
    var nameCoordinator: String {
        return name
    }
    
    func start() {
        first()
    }
}

private extension ProfileCoordinator{
    func first() {
        var vc = factory.makeFirstViewController()
        vc.callBack = {[weak self] in
            self?.second()
        }
        router.setRootModule(vc)
    }
    func second() {
        var vc = factory.makeListViewController()
        vc.callBack = {
            print("vc")
        }
        router.presentModule(vc)
    }
}
