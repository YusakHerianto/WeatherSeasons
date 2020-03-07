//
//  HomePageViewController.swift
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

class HomePageViewController: UIViewController, StoryboardLoadable, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var goToDetailPage: ((ImageType) -> ())?
    var viewModel: HomePageViewModel!
    
    private var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomePageViewModel()
        setupTableView()
        setupBindings()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func setupTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
    }
    private func setupBindings() {
        self.tableView.rx.setDelegate(self)
            .disposed(by: self.disposeBag)
        
        self.tableView.rx
            .modelSelected(HomeImageItem.self)
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .bind { [unowned self] item in
                self.goToDetailPage?(item.type ?? .spring)
            }.disposed(by: disposeBag)

        self.viewModel?.homeDataSource
            .bind(to: tableView.rx.items(dataSource: self.dataSourceHomeListing()))
            .disposed(by: self.disposeBag)
    }
}


//MARK: Tableview Related Functions
extension HomePageViewController{
    private func dataSourceHomeListing() -> RxTableViewSectionedReloadDataSource<HomeListSectionViewModel> {
        return RxTableViewSectionedReloadDataSource<HomeListSectionViewModel>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: className(HomeImageCell.self), for: indexPath) as? HomeImageCell else {
                return UITableViewCell()
            }
            cell.configure(item)
            return cell
        })
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
