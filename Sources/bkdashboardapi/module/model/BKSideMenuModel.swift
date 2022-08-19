//
//  File.swift
//  
//
//  Created by Javier Carapia on 18/08/22.
//

import UIKit

import ghmjolnircore
import bksdkcore

class BKSideMenuModel: GHModelSimpleTableDelegate {
    var image: UIImage?
    var title: String
    var type: BKApiFlow
    var navController: UINavigationController?
    var selected = false
    
    init(image: UIImage?, title: String, type: BKApiFlow, selected: Bool = false) {
        self.image = image
        self.title = title
        self.type = type
        self.selected = selected
    }
    
    var reuseIdentifier: String {
        return "BKSideMenuTableViewCell"
    }
}

extension BKSideMenuModel {
    static var data: [BKSideMenuModel] = {
        return [
            BKSideMenuModel(
                image: UIImage(named: "current_rade_icon", find: .sdk),
                title: "Current Ride",
                type: .currentRide,
                selected: true
            ),
            BKSideMenuModel(
                image: UIImage(named: "my_progress_icon", find: .sdk),
                title: "My Progress",
                type: .myProgress
            )
        ]
    }()
}
