//
//  File.swift
//  
//
//  Created by Javier Carapia on 14/08/22.
//

import ghmjolnircore
import bksdkcore

public class BKDashboardRegisterApi: BKSdkApiManagerProtocol {
    public static var flows: [GHManagerModel] = {
        let dashboardType = BKApiFlow.dashboard
        
        return [
            GHManagerModelBuilder()
                .withType(type: dashboardType.rawValue)
                .withDelegate(delegate: dashboardType)
                .withBundle(bundle: .module)
                .build()
        ]
    }()
}
