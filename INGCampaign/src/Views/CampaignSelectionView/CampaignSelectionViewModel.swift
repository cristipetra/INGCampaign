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
    var pricingRows: [CampaignPricingRow] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    
    func loadChannelsDetails() async
    func onSelectedCampaignPricing(monthlyFee: MonthlyFee)
    func onResetSelection()
}

@MainActor
class CampaignSelectionViewModel: CampaignSelectionViewModelling {
    
    internal var channel: CampaignChannel
    private var services: ChannelServicesProtocol
    private let router: AppRouterProtocol
    private var campaignManager: CampaignConfigurationManagerProtocol 
    
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    
    @Published var channelPricing: ChannelPricing?
    
    @Published private var selectedCampaignPricingMonthlyFee: MonthlyFee?
    
    public init(channel: CampaignChannel,
                services: ChannelServicesProtocol,
                router: AppRouterProtocol,
                campaignManager: CampaignConfigurationManagerProtocol) {
        self.channel = channel
        self.services = services
        self.router = router
        self.campaignManager = campaignManager
    }
    
    var pricingRows: [CampaignPricingRow] {
        guard let channelPricing else { return [] }

        return channelPricing.monthlyFees.enumerated().map { index, fee in
            CampaignPricingRow(
                monthlyFee: fee,
                isChecked: selectedCampaignPricingMonthlyFee == fee
            )
        }
    }
    
    func loadChannelsDetails() async {
        print("load channel details")
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            channelPricing = try await services.getChanellDetails(channelId: channel.channelId)
            selectedCampaignPricingMonthlyFee = campaignManager.selectedCampaigns[channel.channelId]
        } catch {
            errorMessage = "Failed to fetch targeting categories. Please try again later."
        }
        
    }
    
    func onSelectedCampaignPricing(monthlyFee: MonthlyFee) {
        self.selectedCampaignPricingMonthlyFee = monthlyFee
        campaignManager.selectedCampaigns[channel.channelId] = monthlyFee
    }
    
    func onResetSelection() {
        campaignManager.selectedCampaigns[channel.channelId] = nil
        self.selectedCampaignPricingMonthlyFee = nil
    }
    
}

struct CampaignPricingRow: Identifiable {
    let id = UUID()
    let monthlyFee: MonthlyFee
    let isChecked: Bool
}
