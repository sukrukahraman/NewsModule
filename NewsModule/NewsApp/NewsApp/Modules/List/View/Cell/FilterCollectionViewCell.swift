//
//  FilterCollectionViewCell.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: FilterModel) {
        filterLabel.text = model.name.capitalized
        if model.selected {
            filterLabel.textColor = .white
            plusImageView.tintColor = .white
            mainView.layer.borderWidth = 0
            mainView.backgroundColor = .black
        } else {
            filterLabel.textColor = .black
            plusImageView.tintColor = .black
            mainView.layer.borderWidth = 1
            mainView.backgroundColor = .white
        }
    }

}
