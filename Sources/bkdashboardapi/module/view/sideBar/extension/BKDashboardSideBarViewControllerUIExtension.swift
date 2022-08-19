//
//  File.swift
//  
//
//  Created by Javier Carapia on 18/08/22.
//

import UIKit
import TinyConstraints

import ghmjolnircore
import bksdkcore

extension BKDashboardSideBarViewController {
    func setupUI() {
        self.containerSideMenuViewTopConstraint.constant = self.topbarHeight
        
        self.fillListFromDataSource()
        self.addFirstChildController()
    }
    
    func updateUI() {
        self.controllerManager?.setNavBarHiden(hidden: true)
    }
    
    private func fillListFromDataSource() {
        self.strategyTableController.setSource(
            listSource: BKSideMenuModel.data
        )
        
        if !self.strategyTableController.tableView.isDescendant(of: self.containerSideMenuView) {
            self.strategyTableController.delegate = self
            self.containerSideMenuView.addSubview(self.strategyTableController.tableView)
            self.strategyTableController.tableView.edgesToSuperview()
        }
    }
    
    private func addFirstChildController() {
        BKSideMenuModel.data.forEach { model in
            guard let controller = model.type.controller as? BKBaseViewController else { return }
            
            let rideNavigationController = UINavigationController(
                rootViewController: controller
            )
            
            controller.viewModel         = model.type.viewModel
            controller.controllerType    = model.type.rawValue
            controller.bundle            = self.bundle
            controller.controllerManager = self.controllerManager
            
            model.navController = rideNavigationController
            self.viewControllers.append(model)
        }
        
        //TODO: Set default child
        self.activeViewController = self.viewControllers.first { $0.type == .currentRide }?.navController
    }
    
    func removeInactiveViewController(inactiveViewController: UINavigationController?) {
        guard let inacticeVC = inactiveViewController else { return }
        
        inacticeVC.willMove(toParent: nil)
        inacticeVC.view.removeFromSuperview()
        inacticeVC.removeFromParent()
    }
    
    func updateActiveViewController() {
        guard let activeVC = self.activeViewController else { return }
        
        self.addChild(activeVC)
        
        activeVC.view.frame = self.containerChildView.bounds
        self.containerChildView.addSubview(activeVC.view)
        
        activeVC.didMove(toParent: self)
    }
    
    @objc func animateSideMenu(completion: (() -> ())? = nil) {
        if !self.open {
            self.containerChildView.addSubview(self.backView)
        }
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            if self.open {
                self.backView.alpha = 0
                self.containerChildView.frame.origin.x = 0
            }
            else {
                self.backView.alpha = 0.33
                self.containerChildView.frame.origin.x = self.containerChildView.frame.width - 150
            }
        }, completion: { (finished: Bool) in
            completion?()
            self.open.toggle()
            
            if !self.open && self.backView.superview != nil {
                self.backView.removeFromSuperview()
            }
        })
    }
}
