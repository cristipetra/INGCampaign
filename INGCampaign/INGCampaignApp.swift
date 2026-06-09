//
//  INGCampaignApp.swift
//  INGCampaign
//
//  Created by Cristian Petra on 02.06.26.
//

import SwiftUI

@main
struct INGCampaignApp: App {
    
    @State private var appDIContainer = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            AppRootView(container: appDIContainer)
        }
    }
}
