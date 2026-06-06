//
//  CampaignSelectionViewModel.swift
//  INGCampaign
//
//  Created by Cristian Petra on 05.06.26.
//

import Foundation
internal import Combine
import INGCampaignNetworking
import INGCampaignModels

protocol CampaignSelectionViewModelling: ObservableObject {
    var channel: CampaignChannel { get }
    var channelPricing: ChannelPricing? { get }
    func loadChannelsDetails() async
}

class CampaignSelectionViewModel: CampaignSelectionViewModelling {
    
    internal var channel: CampaignChannel
    private var services: ChannelServicesProtocol
    private let router: AppRouterProtocol
    
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    
    @Published var channelPricing: ChannelPricing?
    
    public init(channel: CampaignChannel, services: ChannelServicesProtocol, router: AppRouterProtocol) {
        self.channel = channel
        self.services = services
        self.router = router
    }
    
    func loadChannelsDetails() async {
        print("load channel details")
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            channelPricing = try await services.getChanellDetails(channelId: channel.channelId)
        } catch {
            errorMessage = "Failed to fetch targeting categories. Please try again later."
        }
        
    }
}
