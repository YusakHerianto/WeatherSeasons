//
//  TabBarCoordinator.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit

class TabBarCoordinator {
    var navigationController: UINavigationController?
    
    init () {
    }
    
    func goHomePage() {
        let vc: TabBarViewController = UIStoryboard(name: "Main").instantiateViewController()
        let homePage = vc.viewControllers?[0] as? HomePageViewController
        homePage?.goToDetailPage = goDetailPage
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func goDetailPage(type: ImageType) {
        let vc: DetailPageViewController = UIStoryboard(name: "Main").instantiateViewController()
        vc.viewModel = DetailPageViewModel(imageSelected: type)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
