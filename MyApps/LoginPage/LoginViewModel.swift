//
//  LoginViewModel.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


public class LoginViewModel {

    var submitButtonEnable: PublishSubject<Bool> = PublishSubject()
    var emailSubject: PublishSubject<String> = PublishSubject()
    var passworSubject: PublishSubject<String> = PublishSubject()
    var goToHomePage: PublishSubject<Bool> = PublishSubject()
    
    private var formValidObservable: Observable<Bool>?
    private var disposeBag: DisposeBag! = DisposeBag()
    var emailText: String = ""
    var passwordText: String = ""
    init() {
        submitButtonEnable.onNext(false)
        emailSubject.onNext("")
        passworSubject.onNext("")
        goToHomePage.onNext(false)
        
        setupBinding()
    }
    func setupBinding() {
        emailSubject.asObservable().subscribe(onNext: { [unowned self] (text) in
            self.emailText = text
            self.checkButtonEnable()
        }).disposed(by: self.disposeBag)
        passworSubject.asObservable().subscribe(onNext: { [unowned self] (text) in
            self.passwordText = text
            self.checkButtonEnable()
        }).disposed(by: self.disposeBag)
    }
    func checkButtonEnable() {
        if validateEmail(emailText) && !self.passwordText.isEmpty {
            submitButtonEnable.onNext(true)
            return
        }
        submitButtonEnable.onNext(false)
    }
    func submitPressed() {
        UserDefaults.setEmail(emailText)
        UserDefaults.setPassword(passwordText)
        print(UserDefaults.email() ?? "kosong")
        goToHomePage.onNext(true)
    }
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
