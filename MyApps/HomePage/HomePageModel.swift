//
//  HomePageModel.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

public enum ImageType{
    case winter
    case summer
    case spring
    case autumn
}

public struct HomeImageItem {
    public var type: ImageType?
    public var imageTitle: String
    init(imageTitle: String, type: ImageType) {
        self.type = type
        self.imageTitle = imageTitle
    }
}

struct HomeListSectionViewModel {
    var header: String
    var items: [HomeImageItem]
}

extension HomeListSectionViewModel: SectionModelType {
    typealias Item = HomeImageItem
    
    init(original: HomeListSectionViewModel, items: [HomeImageItem]) {
        self = original
        self.items = items
    }
}

