//
//  NavRouter.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 27/02/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

final class RouterWithNavController: NSObject, Routable {
    
    private var rootController: UIViewController?
    private var completionBlocks: [UIViewController : CompletionBlock]
    
    private var navController: UINavigationController?
    
    init(_ root: UIViewController) {
        rootController = root
        completionBlocks = [:]
    }
    
    func presentModule(_ module: Presentable?) {
        guard let controller = module?.toPresent else { return }
        if navController != nil {
        navController!.pushViewController(controller, animated: true)
        }
    }
    
    func dismissModule(_ module: Presentable?, completion: CompletionBlock?) {
        if navController != nil {
        navController!.popViewController(animated: true)
        }
    }
    
    func setRootModule(_ module: Presentable) {
        let vc = module.toPresent
        
        if let child = rootController?.children, child.count > 0 {
            child[0].willMove(toParent: nil)
            child[0].view.removeFromSuperview()
            child[0].removeFromParent()
        }
        navController = UINavigationController.init(rootViewController: vc!)
        rootController?.addChild(navController!)
        rootController?.view.addSubview(navController!.view)
        navController!.view.frame = rootController!.view.bounds
        navController!.didMove(toParent: rootController)
    }
    
    var toPresent: UIViewController? {
        return rootController
    }

}

