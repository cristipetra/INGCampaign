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
    
    func makeTargetingSelectionViewModel() -> TargetingSelectionViewModel
}

class AppDependencyContainer: DependencyContainer {
    private let apiConfiguration: APIConfiguration = .development
    
    private(set) lazy var apiClient: APIClientProtocol = APIClient(apiConfiguration: apiConfiguration, session: URLSession.shared)
    
    // Services
    private(set) lazy var targetingCategoryServices: TargetingCategoryServicesProtocol = TargetingCategoryServices(apiClient: apiClient)
    
    // ViewModels
    func makeTargetingSelectionViewModel() -> TargetingSelectionViewModel {
        TargetingSelectionViewModel(services: targetingCategoryServices)
    }
}
