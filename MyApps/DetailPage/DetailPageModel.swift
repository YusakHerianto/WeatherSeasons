//
//  DetailPageModel.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

public struct DetailImageItem {
    public var imageTitle: String
    init(imageTitle: String) {
        self.imageTitle = imageTitle
    }
}

struct DetailSectionViewModel {
    var header: String
    var items: [DetailImageItem]
}

extension DetailSectionViewModel: SectionModelType {
    typealias Item = DetailImageItem
    
    init(original: DetailSectionViewModel, items: [DetailImageItem]) {
        self = original
        self.items = items
    }
}
