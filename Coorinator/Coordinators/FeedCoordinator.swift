//
//  FeedCoordinator.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 03/03/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

protocol FeedCoordinatorOutputProtocol {
    var finalBlock: (() -> Void)? {get set}
}

final class FeedCoordinator: FeedCoordinatorOutputProtocol{
    
    var finalBlock: (() -> Void)?
    
    fileprivate var router: Routable
    fileprivate var name: String
    fileprivate var factory: FeedCoordinatorFactoryProtocol
    
    init(name: String, root: UINavigationController) {
        self.name = name
        self.router = RouterForNavigation(root)
        self.factory = FeedCoordinatorFactory()
    }
}

extension FeedCoordinator: Coordinable{
    var nameCoordinator: String {
        return name
    }
    
    func start() {
        first()
    }
}

private extension FeedCoordinator{
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
