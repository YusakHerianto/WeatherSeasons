//
//  LandingCoordinator.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit

class LandingCoordinator {
    var navigationController: UINavigationController?
    weak var baseCoordinator: BaseCoordinator?
    
    func rootViewController() -> UIViewController {
        let landingViewController: LandingViewController =  UIStoryboard(name: "Main").instantiateViewController()
        landingViewController.goLoginPage = self.goLoginPage
        landingViewController.goHomePage = self.goHomePage
        return landingViewController
    }
    
    func goLoginPage() {
        let vc: LoginViewController = UIStoryboard(name: "Main").instantiateViewController()
        vc.goToHomePage = goHomePage
        vc.navigationController?.barHideOnSwipeGestureRecognizer.isEnabled = false
        vc.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        vc.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goHomePage() {
        self.baseCoordinator?.startTabBarCoordinator()
    }
}
