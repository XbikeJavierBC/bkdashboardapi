//
//  File.swift
//  
//
//  Created by Javier Carapia on 18/08/22.
//

import UIKit

import ghmjolnircore
import bksdkcore

extension BKDashboardSideBarViewController: GHStrategyTableControllerDelegate {
    func itemSelected(model: GHModelSimpleTableDelegate) {
        guard let model = model as? BKSideMenuModel else { return }
        
        if !model.selected {
            self.strategyTableController.getSource()?.forEach {
                ($0 as? BKSideMenuModel)?.selected = false
            }
            model.selected = true
            self.strategyTableController.tableView.reloadData()
        }
        
        self.animateSideMenu {
            self.activeViewController = self.viewControllers.first { $0.type == model.type }?.navController
        }
    }
}
