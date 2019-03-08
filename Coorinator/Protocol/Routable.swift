//
//  Routable.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 23/02/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import Foundation

protocol Routable: Presentable {
    
    func presentModule (_ module: Presentable?)
    
    func dismissModule(_ module: Presentable?, completion: CompletionBlock?)
    
    func setRootModule(_ module: Presentable)
}
