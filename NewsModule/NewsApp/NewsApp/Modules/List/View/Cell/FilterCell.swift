//
//  FilterCell.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit
import Utility

class FilterCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(FilterCollectionViewCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout! {
        didSet {
            flowLayout.minimumInteritemSpacing = 15.0
            flowLayout.minimumLineSpacing = 15.0
            flowLayout.itemSize = CGSize(width: 110, height: 40)
        }
    }
    
    var newsFilters: [FilterModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    func configure(filters: [FilterModel]) {
        newsFilters = filters
        collectionView.reloadData()
    }
    
}

extension FilterCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsFilters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: FilterCollectionViewCell.self)
        cell.configure(model: newsFilters[indexPath.item])
        return cell
    }
    
}

extension FilterCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let filter = newsFilters[indexPath.item]
        let width = filter.name.getLabelWidth(font: .systemFont(ofSize: 14)) + 45.0
        return CGSize(width: width, height: 40)
    }
}
