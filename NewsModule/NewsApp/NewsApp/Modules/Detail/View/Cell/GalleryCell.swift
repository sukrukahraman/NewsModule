//
//  GalleryCell.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit
import NewsAPI

class GalleryCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(NewsCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout! {
        didSet {
            flowLayout.minimumLineSpacing = 10
            flowLayout.minimumInteritemSpacing = 10
        }
    }
    
    var timer = Timer()
    var news: [ArticleModel] = []
    var collectionWidth: CGFloat = 0
    var collectionHeight: CGFloat = 0
        
    func configure(articles: [ArticleModel]) {
        collectionWidth = self.frame.size.width
        collectionHeight = collectionWidth*200/350 + 60
        news = articles
        collectionView.reloadData()
        pageControl.numberOfPages = articles.count
        startTimer()
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollToNextNews), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextNews() {
        let nextPage = pageControl.currentPage + 1
        var indexPath = IndexPath(item: 0, section: 0)
        if news.count > nextPage {
            indexPath = IndexPath(item: nextPage, section: 0)
        } else {
            indexPath = IndexPath(item: 0, section: 0)
        }
        
        let rect = self.collectionView.layoutAttributesForItem(at: indexPath)?.frame
        self.collectionView.scrollRectToVisible(rect!, animated: true)
    }

}

extension GalleryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let article = news[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewsCell.self)
        cell.delegate = self
        cell.configure(article: article)
        return cell
    }
    
}

extension GalleryCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionWidth, height:collectionHeight)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(collectionWidth)
        startTimer()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(collectionWidth)
        startTimer()
    }
}

extension GalleryCell: NewsCellDelegate {
    func reloadList() {
        collectionView.reloadData()
    }
}

