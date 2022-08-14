//
//  File.swift
//  
//
//  Created by Javier Carapia on 14/08/22.
//

import UIKit
import ghmjolnircore
import bksdkcore

extension BKApiFlow: GHManagerModelDelegate {
    public func getController() -> GHBaseViewControllerDelegate? {
        switch self {
            case .dashboard:
                return BKDashboardViewController.instantiate(
                    fromStoryboard: self.getStoryboard(),
                    bundle: .module
                )
            default:
                return nil
        }
    }
    
    public func getViewModel() -> GHBaseViewModelProtocol? {
        switch self {
        case .dashboard:
                return BKDashboardViewModel()
            default:
                return nil
        }
    }
    
    func getStoryboard() -> String {
        return "BKDashboard"
    }
}
