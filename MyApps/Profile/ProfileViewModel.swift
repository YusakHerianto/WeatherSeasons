//
//  ProfileViewModel.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 08/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ProfileViewModel {
    var name: String
    var gender: String
    var phone: String
    
    init() {
        name = "Rakka Purnomo"
        gender = "Male"
        phone = "+6287692830"
    }
}
