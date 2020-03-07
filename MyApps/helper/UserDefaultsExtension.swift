//
//  UserDefaultsExtension.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case email
    case password
}

public extension UserDefaults {
    static func setPassword(_ value: String) {
        UserDefaults.standard.set(value, forKey: UserDefaultsKeys.password.rawValue)
    }
    static func password() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.password.rawValue)
    }
    static func setEmail(_ value: String) {
        UserDefaults.standard.set(value, forKey: UserDefaultsKeys.email.rawValue)
    }
    static func email() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.email.rawValue)
    }
}
