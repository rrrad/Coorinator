//
//  MainCoordinator.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 24/02/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit
protocol MainCoordinatorOutputProtocol {
    var finalBlock: (() -> Void)? {get set}
}

class MainCoordinator: BaseCoordinator, MainCoordinatorOutputProtocol {
    
    var finalBlock: (() -> Void)?
    
    fileprivate var name: String
    fileprivate var router: Routable?
    
    init(name: String, root: UIViewController) {
        self.name = name
        router = RouterWithNavController(root)
        super.init()
    }
}

extension MainCoordinator: Coordinable {
    var nameCoordinator: String {
        return name
    }
    
    func start() {
        performFlow()
    }
}


private extension MainCoordinator {
    func performFlow(){
        let vc = ViewController.init(name: "RRR")
        vc.callBack = {[weak self] in
            self?.next()
        }
        router?.setRootModule(vc)
    }
    
    func next() {
        let vc = ViewController.init(name: "trt")
        vc.callBack = {[weak self] in
            self?.finalBlock!()
        }
        router?.setRootModule(vc)
    }
    
}

