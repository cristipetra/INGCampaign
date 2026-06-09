//
//  ChannelListViewModel.swift
//  INGCampaign
//
//  Created by Cristian Petra on 04.06.26.
//

import Foundation
import INGCampaignNetworking
import INGCampaignModels
internal import Combine

@MainActor
protocol ChannelListViewModelling: ObservableObject {
    var campaignChannels: [CampaignChannel] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    
    func onTapChannel(channel: CampaignChannel)
    func onTapReviewSelection()
}

class ChannelListViewModel: ChannelListViewModelling {
    
    @Published internal var campaignChannels: [CampaignChannel]
    private var services: ChannelServicesProtocol
    private let router: AppRouterProtocol
    private let campaingManager: CampaignConfigurationManagerProtocol
    
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    
    public init(campaignChannels: [CampaignChannel],
                services: ChannelServicesProtocol,
                router: AppRouterProtocol,
                campaingManager: CampaignConfigurationManagerProtocol)
    {
        self.campaignChannels = campaignChannels
        self.services = services
        self.router = router
        self.campaingManager = campaingManager
    }
    
    func onTapChannel(channel: CampaignChannel) {
        router.navigate(to: .campaignSelection(channel: channel))
    }
    
    func onTapReviewSelection() {
        router.navigate(to: .reviewSelection)
    }
    
}
