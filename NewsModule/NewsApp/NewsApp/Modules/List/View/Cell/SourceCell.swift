//
//  SourceCell.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit

class SourceCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String?, description: String?) {
        titleLabel.text = title
        descriptionLabel.text = description
        
    }
    
}
