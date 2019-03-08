//
//  Router.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 23/02/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

final class Router: NSObject, Routable {
    
    private var rootController: UIViewController?
    private var completionBlocks: [UIViewController : CompletionBlock]
    
    init(_ root: UIViewController) {
        rootController = root
        completionBlocks = [:]
    }
    
    func presentModule(_ module: Presentable?) {
        guard let controller = module?.toPresent else { return }
        rootController?.present(controller, animated: true, completion: nil)
    }
    
    func dismissModule(_ module: Presentable?, completion: CompletionBlock?) {
        rootController?.dismiss(animated: true, completion: completion)
    }
    
    func setRootModule(_ module: Presentable) {
        let vc = module.toPresent
        
        if let child = rootController?.children, child.count > 0 {
            child[0].willMove(toParent: nil)
            child[0].view.removeFromSuperview()
            child[0].removeFromParent()
        }
        rootController?.addChild(module.toPresent!)
        rootController?.view.addSubview(module.toPresent!.view)
        vc!.view.frame = rootController!.view.bounds
        vc!.didMove(toParent: rootController)
    }

    var toPresent: UIViewController? {
        return rootController
    }

}
