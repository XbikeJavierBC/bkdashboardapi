//
//  File.swift
//  
//
//  Created by Javier Carapia on 14/08/22.
//

import UIKit
import bksdkcore

internal class BKDashboardViewController: BKBaseTabBarViewController {
    //TODO: User Titles
    internal var listTitle = [String]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateUI()
        
        if let controller = self.viewControllers?[self.selectedIndex] as? BKBaseViewController,
                    controller.children.isEmpty {
            self.cleanNavigationBar()
            self.title = self.listTitle[self.selectedIndex]
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.cleanNavigationBar()
        self.updateUI()
        self.title = self.listTitle[item.tag]
    }
    
    override func leftNavButtonSelector() {
        self.title = self.listTitle[self.selectedIndex]
        
        if let controller = self.viewControllers?[self.selectedIndex] as? BKBaseViewController {
            controller.leftNavButtonSelector()
        }
    }
    
    override func rightNavButtonSelector() {
        self.title = self.listTitle[self.selectedIndex]
        
        if let controller = self.viewControllers?[self.selectedIndex] as? BKBaseViewController {
            controller.rightNavButtonSelector()
        }
    }
}
