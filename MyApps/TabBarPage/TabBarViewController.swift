//
//  TabBarViewController.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController, StoryboardLoadable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Apps"
        self.tabBarController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: true);
        self.tabBarController?.navigationItem.backBarButtonItem?.isEnabled = false
    }
}
