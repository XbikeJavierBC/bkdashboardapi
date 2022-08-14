//
//  File.swift
//  
//
//  Created by Javier Carapia on 14/08/22.
//

import UIKit
import bksdkcore

internal struct BKDashboardFlowModel {
    var title: String
    var type: BKApiFlow
    var imageDefault: UIImage?
    var imageSelected: UIImage?
}

extension BKDashboardFlowModel {
    static func getUserList() -> [BKDashboardFlowModel] {
        return [
            BKDashboardFlowModel(
                title: "Current Ride",
                type: .currentRide,
                imageDefault: UIImage(
                    named: "search_tab_icon",
                    find: .sdk
                ),
                imageSelected: UIImage(
                    named: "search_tab_icon",
                    find: .sdk
                )
            ),
            BKDashboardFlowModel(
                title: "My Progress",
                type: .myProgress,
                imageDefault: UIImage(
                    named: "menu_tab_bar",
                    find: .sdk
                ),
                imageSelected: UIImage(
                    named: "menu_tab_bar_selected",
                    find: .sdk
                )
            )
        ]
    }
}
