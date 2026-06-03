//
//  TargetingCategoryServicesProtocol.swift
//  INGCampaignNetworking
//
//  Created by Cristian Petra on 02.06.26.
//
import Foundation
import INGCampaignModels

public protocol TargetingCategoryServicesProtocol {
    func getTargets() async throws -> [TargetingCategory]
}

public class TargetingCategoryServices: TargetingCategoryServicesProtocol {    
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func getTargets() async throws -> [TargetingCategory] {
        let targets: [TargetingCategory] = try await apiClient.send(endpoint: .getTargets)
        
        return targets
    }
}
