//
//  File.swift
//  
//
//  Created by Javier Carapia on 14/08/22.
//

import ghmjolnircore

public protocol BKDashboardViewModelProtocol: GHBaseViewModelProtocol {
    var errorLiveData: GHLiveData<(id: Any, error: Error)?> { get set }
}

public protocol BKDashboardCoordinatorProtocol: GHBaseCoordinatorProtocol {
    
}
