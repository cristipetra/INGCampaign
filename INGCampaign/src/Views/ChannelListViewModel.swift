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
    
    //func loadChannelDetail(channelId: String) async throws -> CampaignChannel
    func loadChannelsDetails() async
    
    func onTapChannel(channel: CampaignChannel)
}

class ChannelListViewModel: ChannelListViewModelling {
    
    @Published internal var campaignChannels: [CampaignChannel]
    private var services: ChannelServicesProtocol
    private let router: AppRouterProtocol
    
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    
    public init(campaignChannels: [CampaignChannel], services: ChannelServicesProtocol, router: AppRouterProtocol) {
        self.campaignChannels = campaignChannels
        print(campaignChannels)
        self.services = services
        self.router = router
    }
    
//    func loadChannelDetail(channelId: String) async throws -> CampaignChannel {
//        try await services.getChanellDetails(channelId: channelId)
//    }
    
    func loadChannelsDetails() async {
        var channels: [CampaignChannel] = []
        for channel in campaignChannels {
            do {
                //let campaignChannel = try await loadChannelDetail(channelId: channel.channelId)
                //channels.append(campaignChannel)
            } catch {
                print("Error loading channel: \(error)")
            }
        }
        
        campaignChannels = channels
    }
    
    func onTapChannel(channel: CampaignChannel) {
        router.navigate(to: .campaignSelection(channel: channel))
    }
    
}
