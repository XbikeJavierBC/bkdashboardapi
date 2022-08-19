//
//  File.swift
//  
//
//  Created by Javier Carapia on 18/08/22.
//

import UIKit

import ghmjolnircore
import bksdkcore

class BKDashboardSideBarViewController: BKBaseViewController {
    //MARK: IBOUTLETS
    @IBOutlet var rootView: UIView! {
        didSet {
            rootView.backgroundColor = .oragenColor
        }
    }
    
    @IBOutlet weak var containerSideMenuView: UIView! {
        didSet {
            containerSideMenuView.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var containerChildView: UIView! {
        didSet {
            containerChildView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var sideMenuButton: UIButton! {
        didSet {
            let image = UIImage(named: "menu_icon", find: .sdk)?.imageRendering
            sideMenuButton.setImage(
                image,
                for: .normal
            )
            sideMenuButton.tintColor = .white
        }
    }
    
    @IBOutlet weak var containerChildViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerChildViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerSideMenuViewTopConstraint: NSLayoutConstraint!
    
    //MARK: PROPERTIES
    internal lazy var strategyTableController: GHStrategyTableController = {
        let list = GHStrategyTableController(nibList: [("BKSideMenuTableViewCell", .module)])
        list.delegate = self
        
        return list
    }()
    
    internal var activeViewController: UINavigationController? {
        didSet {
            self.removeInactiveViewController(inactiveViewController: oldValue)
            self.updateActiveViewController()
        }
    }
    
    internal lazy var backView: UIView = {
        let view = UIView(
            frame: self.containerChildView.bounds
        )
        view.backgroundColor = UIColor.black
        view.alpha = 0
        view.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(viewAction)
        )
        
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
        (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    //MARK: VARIABLES
    internal lazy var viewControllers: [BKSideMenuModel] = []
    internal var open: Bool = false
    
    //MARK: LIVE CICLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateUI()
    }
    
    @IBAction func sideMenuButtonAction(_ sender: Any) {
        self.animateSideMenu()
    }
    
    @objc func viewAction() {
        self.animateSideMenu()
    }
}
