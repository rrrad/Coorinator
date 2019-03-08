//
//  RouterForNavigation.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 03/03/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

final class RouterForNavigation: NSObject, Routable {
    
    private var rootController: UINavigationController?
    private var completionBlocks: [UIViewController : CompletionBlock]
    
    
    init(_ root: UINavigationController) {
        rootController = root
        completionBlocks = [:]
    }
    
    func presentModule(_ module: Presentable?) {
        guard let controller = module?.toPresent else { return }
        if rootController != nil {
            rootController!.pushViewController(controller, animated: true)
        }
    }
    
    func dismissModule(_ module: Presentable?, completion: CompletionBlock?) {
        if rootController != nil {
            rootController!.popViewController(animated: true)
        }
    }
    
    func setRootModule(_ module: Presentable) {
        guard let controller = module.toPresent else { return }
        rootController?.setViewControllers([controller], animated: false)
    }
    
    var toPresent: UIViewController? {
        return rootController
    }
    
}
