//
//  LandingViewController.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LandingViewController: UIViewController, StoryboardLoadable {
    
     let viewModel = LandingViewModel()
     @IBOutlet weak var splashScreen: UIImageView!

     var goLoginPage: (() -> ())?
     var goHomePage: (() -> ())?
     
    var disposeBag: DisposeBag! = DisposeBag()
    
     override func viewDidLoad() {
         super.viewDidLoad()
         self.navigationItem.setHidesBackButton(true, animated: true)
         splashScreen.contentMode = .scaleAspectFill
         self.setupBindings()
         self.viewModel.checkGoToLoginPage()
    }

     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: true)
     }
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)
     }
    fileprivate func setupBindings(){
        viewModel.displayingLoginPage.asObservable().subscribe(
            onNext: { [unowned self] (isDisplayingAuthPage) in
                if(isDisplayingAuthPage){
                    self.goLoginPage?()
                }
        }).disposed(by: disposeBag)
        
        viewModel.displayingHomePage.asObservable().subscribe(
            onNext: { [unowned self] (isDisplayingEventPage) in
                if(isDisplayingEventPage){
                    self.goHomePage?()
                    return
                }
        }).disposed(by: disposeBag)

    }
 
}
