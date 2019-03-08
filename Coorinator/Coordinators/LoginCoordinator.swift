//
//  LoginCoordinator.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 24/02/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

protocol LoginCoordinatorOutputProtocol {
    var finalBlock: (() -> Void)? {get set}
}

class LoginCoordinator: LoginCoordinatorOutputProtocol {
    var finalBlock: (() -> Void)?
    
    fileprivate var name: String
    fileprivate var router: Routable
    fileprivate var factory: LoginCoordinatorFactoryProtocol
    
    init(name: String, root: UIViewController) {
        self.name = name
        router = Router.init(root)
        factory = LoginCoordinatorFactory()
    }
}

extension LoginCoordinator: Coordinable {
    var nameCoordinator: String {
        return name
    }
    
    func start()  {
        loginScreen()
    }
}


private extension LoginCoordinator {
    func loginScreen(){
        var vc = factory.makeFirstViewController()
        vc.callBack = {[weak self] in
            self?.router.dismissModule(vc, completion: nil)
            self?.finalBlock!()
        }
        router.setRootModule(vc)
    }
    
    func next() {
        let vc = ViewController.init(name: "rer")
        router.presentModule(vc)
    }
}
