//
//  HomePageCell.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeImageCell: UITableViewCell {
    private(set) var disposeBag = DisposeBag()
    @IBOutlet weak var imageCell: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    public func configure(_ entry: HomeImageItem) {
        imageCell.image = UIImage(named: entry.imageTitle)
        imageCell.contentMode = .scaleAspectFill
    }
}

