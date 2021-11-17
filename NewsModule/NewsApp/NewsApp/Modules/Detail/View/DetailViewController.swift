//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(NewsCell.self)
            collectionView.register(GalleryCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var viewModel: DetailViewModel!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.updateTitle(title: viewModel.source.name)
        fetchNews()
        startTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopTimer()
    }
    
    @objc func fetchNews() {
        viewModel.load()
    }
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(fetchNews), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }

}

extension DetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModel.feeds[section] {
        case .gallery(_):
            return 1
        case .article(let articles):
            return articles.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.feeds[indexPath.section] {
        case .gallery(let articles):
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: GalleryCell.self)
            cell.configure(articles: articles)
            return cell
        case .article(let articles):
            let article = articles[indexPath.row]
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewsCell.self)
            cell.delegate = self
            cell.configure(article: article)
            return cell
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width
        let height = width*200/350 + 60
        switch viewModel.feeds[indexPath.section] {
        case .gallery(_):
            return CGSize(width: width, height:height + 50)
        case .article(_):
            return CGSize(width: width, height:height)
        }
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func fillList() {
        collectionView.reloadData()
    }
    
    func update(title: String?) {
        navigationItem.title = title
    }
    
}

extension DetailViewController: NewsCellDelegate {
    func reloadList() {
        collectionView.reloadData()

    }
}
