//
//  DetailPageViewModel.swift
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

class DetailPageViewModel {
    var detailDataSource: BehaviorRelay<[DetailSectionViewModel]> = BehaviorRelay(value: [])
    private var disposeBag: DisposeBag = DisposeBag()
    var imageSelected: ImageType
    var dataSource: [DetailImageItem] = []
    init (imageSelected : ImageType) {
        self.imageSelected = imageSelected
        self.detailDataSource.accept([DetailSectionViewModel(header: "header_detail_page", items: self.generageImageItems())])
        dataSource = generageImageItems()
    }
    func generageImageItems() -> [DetailImageItem]{
        var images: [String] = []
        switch imageSelected {
        case .autumn:
            images = ["autumn1", "autumn2", "autumn1" ]
        case .spring:
            images = ["spring1", "spring2", "spring3" ]
        case .winter:
            images = ["winter1", "winter2", "winter3" ]
        case .summer:
            images = ["summer1", "summer2", "summer3" ]
        }
        var detailItem: [DetailImageItem] = []
        images.forEach { (item) in
            detailItem.append(DetailImageItem(imageTitle: item))
        }
        return detailItem
    }
}
