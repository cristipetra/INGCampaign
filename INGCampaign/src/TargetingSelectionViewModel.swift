//
//  TargetingSelectionViewModel.swift
//  INGCampaign
//
//  Created by Cristian Petra on 02.06.26.
//

import Foundation
import INGCampaignNetworking
import INGCampaignModels
internal import Combine
import SwiftUI

@MainActor
protocol TargetingSelectionViewModelling: ObservableObject {
    
    var targetingCategories: [TargetingCategory] { get }
    var selectedCategories: [TargetingCategory] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    
    func loadTargetingCategories() async
    func onTapCategory(_ category: TargetingCategory)
    func onTapContinue()
}


class TargetingSelectionViewModel: TargetingSelectionViewModelling {
    
    private var services: TargetingCategoryServicesProtocol
    private let router: AppRouterProtocol
    
    @Published var targetingCategories: [TargetingCategory] = []
    @Published var selectedCategories: [TargetingCategory] = []
    
    private var campaignManager: CampaignConfigurationManagerProtocol
    
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    
    public init(services: TargetingCategoryServicesProtocol,
                router: AppRouterProtocol,
                campaignManager: CampaignConfigurationManagerProtocol) {
        self.services = services
        self.router = router
        self.campaignManager = campaignManager
    }

    func loadTargetingCategories() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            targetingCategories = try await services.getTargets()
            selectedCategories = campaignManager.selectedCategories
        } catch {
            errorMessage = "Failed to fetch targeting categories. Please try again later."
        }
    }
    
    func onTapCategory(_ category: TargetingCategory) {
        if !selectedCategories.contains(where: { $0.id == category.id } ) {
            selectedCategories.append(category)
            campaignManager.selectedCategories.append(category)
        } else {
            selectedCategories.removeAll(where: { $0.id == category.id } )
            campaignManager.selectedCategories.removeAll(where: { $0.id == category.id } )
        }
    }
    
    func onTapContinue() {
        let chn: [CampaignChannel] = getChannels()
        router.navigate(to: .channelList(channels: chn))
    }
    
    func getChannels() -> [CampaignChannel] {
        let channels: Set<CampaignChannel> = Set(selectedCategories.flatMap { $0.availableChannels })
        return Array(channels)
    }

}
