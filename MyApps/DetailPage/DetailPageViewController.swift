//
//  DetailPageViewController.swift
//  MyApps
//
//  Created by Yusak Edwin  Herianto on 07/03/20.
//  Copyright © 2020 Yusak Edwin  Herianto. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import RxDataSources


class DetailPageViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    private var disposeBag: DisposeBag = DisposeBag()
    var viewModel: DetailPageViewModel!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Apps"
        setupBindings()
        setupPageControl()
        setupCollectionView()
    }
    func setupPageControl() {
        self.pageControl.numberOfPages = self.viewModel.detailDataSource.value[0].items.count
    }
    func setupCollectionView() {
        collectionView.allowsSelection = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    private func setupBindings() {
        self.collectionView.rx.setDelegate(self)
           .disposed(by: self.disposeBag)

        self.viewModel?.detailDataSource
            .bind(to: collectionView.rx.items(dataSource: self.dataSourceDetailPage()))
            .disposed(by: self.disposeBag)
    }
}

//MARK: CollectionView Related Functions
extension DetailPageViewController{
    private func dataSourceDetailPage() -> RxCollectionViewSectionedReloadDataSource<DetailSectionViewModel> {
        return RxCollectionViewSectionedReloadDataSource<DetailSectionViewModel>(configureCell: { (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: className(DetailPageCell.self), for: indexPath) as? DetailPageCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            return cell
        })
    }
}

//MARK: CollectionView Delegate Functions
extension DetailPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize( width: width, height: height )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
}
