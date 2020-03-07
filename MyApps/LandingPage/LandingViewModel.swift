//
//  LandingViewModel.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LandingViewModel{
    var displayingLoginPage: PublishSubject<Bool> = PublishSubject()
    var displayingHomePage: PublishSubject<Bool> = PublishSubject()
    private var disposeBag: DisposeBag! = DisposeBag()

    init(){
        self.displayingLoginPage.on(.next(false))
        self.displayingHomePage.on(.next(false))
    }
    
    func checkGoToLoginPage() {
        let email = UserDefaults.email() ?? ""
        let password = UserDefaults.password() ?? ""
        if !email.isEmpty && !password.isEmpty {
            print("go home page")
            displayingHomePage.onNext(true)
            return
        }
        displayingLoginPage.onNext(true)
    }
}
