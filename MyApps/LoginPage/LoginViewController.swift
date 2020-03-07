//
//  LoginViewController.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 06/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import RxSwift
import RxCocoa
import MBProgressHUD

class LoginViewController: UIViewController, StoryboardLoadable {
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var submitButton: SubmitButton!
    private(set) var disposeBag = DisposeBag()
    var viewModel = LoginViewModel()
    var goToHomePage: (()->())?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        setupBinding()
    }
    func setupBinding() {
        viewModel.submitButtonEnable.asObservable()
            .subscribe(onNext: { [unowned self] (isEnable) in
                self.submitButton.isEnabled = isEnable
            }).disposed(by: self.disposeBag)
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailSubject)
            .disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.passworSubject)
            .disposed(by: disposeBag)
        viewModel.goToHomePage.asObservable()
            .subscribe(onNext: { [unowned self](result) in
                if result {
                    self.goToHomePage?()
                    self.submitButton.isEnabled = true
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
            }).disposed(by: self.disposeBag)
        submitButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
                self.submitButton.isEnabled = false
                MBProgressHUD.showAdded(to: self.view, animated: true)
                self.viewModel.submitPressed()
            }).disposed(by: disposeBag)
    }
    @objc func didTapView() {
        self.view.endEditing(true)
    }

    @objc fileprivate func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

