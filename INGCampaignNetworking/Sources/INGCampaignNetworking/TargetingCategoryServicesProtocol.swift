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
    public init() { }
    public func getTargets() async throws -> [TargetingCategory] {
        return MockTargetingCategory().targets
    }
}
