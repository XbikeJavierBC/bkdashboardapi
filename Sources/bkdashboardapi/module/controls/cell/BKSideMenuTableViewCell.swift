//
//  BKSideMenuTableViewCell.swift
//  
//
//  Created by Javier Carapia on 18/08/22.
//

import UIKit

import ghmjolnircore
import bksdkcore

class BKSideMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .abelRegular15
        }
    }
}

extension BKSideMenuTableViewCell: GHSimpleTableViewCellDelegate {
    func bind(model: GHModelSimpleTableDelegate) {
        guard let model = model as? BKSideMenuModel else { return }
        
        self.logoImageView.image = model.image?.imageRendering
        self.titleLabel.text = model.title
        
        self.containerView.backgroundColor = model.selected
                ? .oragenColor.withAlphaComponent(0.85)
                : .clear
        
        self.titleLabel.textColor = model.selected
                ? .white
                : .subtitleTextColor
        
        self.logoImageView.tintColor = model.selected
                ? .white
                : .black
    }
}
