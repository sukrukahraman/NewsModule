//
//  StringExtension.swift
//  Utility
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit

public extension String {
    
    func getLabelWidth(font: UIFont) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 1
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        
        return label.intrinsicContentSize.width
    }
    
}
