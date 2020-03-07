//
//  ProfileViewController.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 08/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    var viewModel: ProfileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.layer.borderWidth = 3
        if #available(iOS 13.0, *) {
            profileView.layer.borderColor = UIColor.label.cgColor
        } else {
            profileView.layer.borderColor = UIColor.black.cgColor
            // Fallback on earlier versions
        }
        nameLabel.text = viewModel.name
        genderLabel.text = viewModel.gender
        phoneLabel.text = viewModel.phone
    }
}
