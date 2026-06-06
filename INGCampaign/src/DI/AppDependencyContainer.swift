//
//  AppDependencyContainer.swift
//  INGCampaign
//
//  Created by Cristian Petra on 03.06.26.
//
import Foundation
import INGCampaignNetworking
import INGCampaignModels

protocol DependencyContainer {
    
    var targetingCategoryServices: TargetingCategoryServicesProtocol { get }
    
    func makeTargetingSelectionViewModel(router: AppRouterProtocol) -> TargetingSelectionViewModel
    func makeChannelListViewModel(campaignChannels: [CampaignChannel], router: AppRouterProtocol) -> ChannelListViewModel
    func makeCampaingSelectionViewModel(campaignChannel: CampaignChannel, router: AppRouterProtocol) -> CampaignSelectionViewModel
}

class AppDependencyContainer: DependencyContainer {
    private let apiConfiguration: APIConfiguration = .development
    
    private(set) lazy var apiClient: APIClientProtocol = APIClient(apiConfiguration: apiConfiguration, session: URLSession.shared)
    
    // Services
    private(set) lazy var targetingCategoryServices: TargetingCategoryServicesProtocol = TargetingCategoryServices(apiClient: apiClient)
    private(set) lazy var channelServices: ChannelServicesProtocol = ChannelServices(apiClient: apiClient)
        
    // ViewModels
    func makeTargetingSelectionViewModel(router: AppRouterProtocol) -> TargetingSelectionViewModel {
        TargetingSelectionViewModel(services: targetingCategoryServices, router: router)
    }
    
    func makeChannelListViewModel(campaignChannels: [CampaignChannel], router: AppRouterProtocol) -> ChannelListViewModel {
        ChannelListViewModel(campaignChannels: campaignChannels, services: channelServices, router: router)
    }
    
    func makeCampaingSelectionViewModel(campaignChannel: CampaignChannel, router: AppRouterProtocol) -> CampaignSelectionViewModel {
        CampaignSelectionViewModel(channel: campaignChannel, services: channelServices, router: router)
    }
}
