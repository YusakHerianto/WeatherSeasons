//
//  BaseCoordinator.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator {
    var window: UIWindow?
    var navigationController: UINavigationController?

    var landingCoordinator: LandingCoordinator
    var tabBarCoordinator: TabBarCoordinator?
    
    public init(window: UIWindow?) {
        self.window = window
        landingCoordinator = LandingCoordinator()
        self.navigationController = UINavigationController(rootViewController: landingCoordinator.rootViewController())
        self.window?.rootViewController = self.navigationController
        landingCoordinator.navigationController = self.navigationController
        landingCoordinator.baseCoordinator = self
    }
    
    public func start() {
        window?.makeKeyAndVisible()
    }

    public func startTabBarCoordinator(){
        if(self.tabBarCoordinator == nil){
            self.tabBarCoordinator = TabBarCoordinator()
        }
        tabBarCoordinator!.navigationController = self.navigationController
        tabBarCoordinator!.goHomePage()
    }
}
