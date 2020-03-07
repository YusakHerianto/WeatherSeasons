//
//  SubmitButtonView.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit

class SubmitButton: UIButton {
    
    override var isEnabled: Bool {
        didSet{
            self.setTitleColor(UIColor.systemBlue, for: .normal)
            self.setTitleColor(UIColor.systemGray, for: .disabled)
        }
    }
}
