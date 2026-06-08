//
//  AppContainerView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 04.06.26.
//

import SwiftUI

struct AppContainerView: View {
    let container: AppDependencyContainer
    @StateObject private var router = CampaignRouter()
    
    var body: some View {
        // Handles routing
//        NavigationStack(path: $router.path) {
//            TargetingSelectionView(viewModel: container.makeTargetingSelectionViewModel())
//                .navigationDestination(for: CampaignRoute.self) { route in
//                    switch route {
//                        case .targetSelection:
//                            TargetingSelectionView(viewModel: container.makeTargetingSelectionViewModel())
//                        case .channelList:
//                            //ChannelListView(viewModel: container.makeChannelListViewModel())
//                        
//                            ChannelListView()
//                    }
//            }
        
        Text("hello")
        
    }
}

#Preview {
    //AppContainerView()
}
