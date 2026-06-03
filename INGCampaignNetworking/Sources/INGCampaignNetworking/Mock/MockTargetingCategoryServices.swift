//
//  MockTargetingCategoryServices.swift
//  INGCampaignNetworking
//
//  Created by Cristian Petra on 02.06.26.
//
import Foundation
import INGCampaignModels

public struct MockTargetingCategoryServices: TargetingCategoryServicesProtocol {
    public func getTargets() async throws -> [TargetingCategory] {
        return MockTargetingCategory().targets
    }
    
    public func getTargetsSecond() async throws -> [TargetingCategory] {
        return MockTargetingCategory().targets
    }
}
