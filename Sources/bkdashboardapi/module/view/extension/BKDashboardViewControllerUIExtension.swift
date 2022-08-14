//
//  File.swift
//  
//
//  Created by Javier Carapia on 14/08/22.
//

import UIKit
import bksdkcore

extension BKDashboardViewController {
    func setupUI() {
        self.cleanNavigationBar()
        
        self.makeUserFlow()
    }
    
    func updateUI() {
        self.controllerManager?.setNavBarHiden(hidden: true)
    }
    
    private func makeUserFlow() {
        BKDashboardFlowModel.getUserList().enumerated().forEach { model in
            guard let controller = model.element.type.controller as? BKBaseViewController else {
                return
            }
            
            self.listTitle.append(model.element.title)
            
            let navigationController = UINavigationController(
                rootViewController: controller
            )
            
            controller.viewModel = model.element.type.viewModel
            controller.controllerType = model.element.type.rawValue
            controller.controllerManager = self.controllerManager
            controller.bundle = self.bundle
            
            controller.tabBarItem.image = model.element.imageDefault
            controller.tabBarItem.selectedImage = model.element.imageSelected
            controller.tabBarItem.tag = model.offset
            
            var array = self.viewControllers ?? []
            array.append(navigationController)
            
            self.viewControllers = array
            
            guard let items = tabBar.items else { return }
            
            items[model.offset].title = model.element.title
        }
    }
}
