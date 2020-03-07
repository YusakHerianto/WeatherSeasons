//
//  HomePageViewModel.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomePageViewModel {
    var homeDataSource: BehaviorRelay<[HomeListSectionViewModel]> = BehaviorRelay(value: [])
    private var disposeBag: DisposeBag = DisposeBag()
    
    init () {
        self.homeDataSource.accept([HomeListSectionViewModel(header: "title_home_page", items: self.generageImageItems())])
    }
    func generageImageItems() -> [HomeImageItem]{
        let imageItem = [HomeImageItem(imageTitle: "spring", type: .spring), HomeImageItem(imageTitle: "autumn", type: .autumn), HomeImageItem(imageTitle: "winter", type: .winter), HomeImageItem(imageTitle: "summer", type: .summer)]
        return imageItem
    }
}
