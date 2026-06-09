//
//  CampaignFlowView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 04.06.26.
//

import SwiftUI

struct AppRootView: View {
    let container: AppDependencyContainer
    
    var body: some View {
        CampaignFlowView(container: container)
    }
}

#Preview {
    //CampaignFlowView()
}
