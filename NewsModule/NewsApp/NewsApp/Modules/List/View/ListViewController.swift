//
//  ListViewController.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit
import Utility
import NewsAPI

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(FilterCell.self)
            tableView.register(SourceCell.self)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    var viewModel: ListViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.updateTitle(title: "sources".localized)
        viewModel.load()
    }
    
}

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.feeds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.feeds[section] {
        case .categories(_):
            return 1
        case .news(sources: let sources):
            return sources.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.feeds[indexPath.section] {
        case .categories(let filters):
            let cell = tableView.dequeueReusableCell(FilterCell.self)
            cell.delegate = self
            cell.configure(filters: filters)
            return cell
        case .news(let sources):
            let source = sources[indexPath.row]
            let cell = tableView.dequeueReusableCell(SourceCell.self)
            cell.configure(title: source.name, description: source.sourceDescription)
            return cell
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.feeds[indexPath.section] {
        case .categories(_):
            return 50
        case .news(_):
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.feeds[indexPath.section] {
        case .categories(_):
            break
        case .news(let sources):
            viewModel.selectNews(source: sources[indexPath.row])
        }
    }
    
}

extension ListViewController: ListViewModelDelegate {
    func update(title: String) {
        navigationItem.title = title
    }
    
    func fillList() {
        tableView.reloadData()
    }
    
    func showDetail(source: SourceModel) {
        let movieDetailViewController = DetailBuilder.make(source: source)
        show(movieDetailViewController, sender: nil)
    }
}

extension ListViewController: FilterCellDelegate {
    func selectItem(model: FilterModel) {
        viewModel.filtersFeed.removeAll()
        for filterModel in viewModel.filterModels {
            if filterModel.name == model.name {
                filterModel.selected = !filterModel.selected
            }
            if filterModel.selected {
                let filtered = viewModel.sourceModels.filter { $0.category == filterModel.name}
                viewModel.filtersFeed.append(contentsOf: filtered)
            }
        }
                
        viewModel.updateFeeds(feed: viewModel.filtersFeed.count > 0 ? viewModel.filtersFeed : viewModel.sourceModels)
        tableView.reloadData()
    }
}
