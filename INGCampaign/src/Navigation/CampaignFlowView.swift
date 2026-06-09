//
//  CampaignFlowView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 04.06.26.
//

import SwiftUI

struct CampaignFlowView: View {
    
    @StateObject private var router = CampaignRouter()
    let container: DependencyContainer

    var body: some View {
        NavigationStack(path: $router.path) {
            destination(.targetSelection)
                .navigationDestination(for: CampaignRoute.self, destination: destination)
        }
    }

    @ViewBuilder
    private func destination(_ route: CampaignRoute) -> some View {
        switch route {
        case .targetSelection:
            TargetingSelectionView(
                viewModel: container.makeTargetingSelectionViewModel(
                    router: router
                )
            )
        case .channelList(let channels):
            ChannelListView(
                viewModel: container.makeChannelListViewModel(
                    campaignChannels:channels,
                    router: router
                )
            )
        case .campaignSelection(let channel):
            CampaignSelectionView(
                viewModel: container.makeCampaingSelectionViewModel(
                    campaignChannel: channel,
                    router: router
                )
            )
        case .reviewSelection:
            CampaignReviewSelectionView(
                viewModel: container.makeCampaignReviewSelectionViewModel()
            )
        }
    }
}

#Preview {
    //CampaignFlowView()
}
