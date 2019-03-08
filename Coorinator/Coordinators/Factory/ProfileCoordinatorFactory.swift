//
//  ProfileCoordinatorFactory.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 08/03/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import Foundation

protocol ProfileCoordinatorFactoryProtocol {
    func makeFirstViewController() -> Presentable & ViewControllerOutputProtocol
    func makeListViewController() -> Presentable & ViewControllerOutputProtocol
    
}

class ProfileCoordinatorFactory: ProfileCoordinatorFactoryProtocol {
    func makeListViewController() -> Presentable & ViewControllerOutputProtocol {
        return ViewController.init(name: "list")
    }
    
    func makeFirstViewController() -> Presentable & ViewControllerOutputProtocol {
        return ViewController.init(name: "profile")
    }
}
