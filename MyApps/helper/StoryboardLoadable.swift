//
//  StoryboardLoadable.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit

public protocol StoryboardLoadable: class {

}

public extension StoryboardLoadable where Self: UIViewController {
    static var getStoryBoardIdentifier: String {
        return String(describing: self)
    }
}

public extension UIStoryboard {

    convenience init(name: String) {
        self.init(name: name, bundle: Bundle.main)
    }

    final func instantiateViewController <T: UIViewController>() -> T where T: StoryboardLoadable {
        return self.instantiateViewController(withIdentifier: T.getStoryBoardIdentifier) as! T
    }
}

public func className(_ klass: AnyClass) -> String {
    let classString = NSStringFromClass(klass)
    // The entity is the last component of dot-separated class name:
    let components = classString.components(separatedBy: ".")
    return components.last ?? classString
}
