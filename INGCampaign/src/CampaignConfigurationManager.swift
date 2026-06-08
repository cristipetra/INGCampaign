//
//  CampaignConfigurationManager.swift
//  INGCampaign
//
//  Created by Cristian Petra on 08.06.26.
//
import Foundation
import INGCampaignModels
internal import Combine

protocol CampaignConfigurationManagerProtocol {
    var selectedTargetIDs: Set<String> { get set }
    var selectedCampaigns: [String: MonthlyFee] { get set }
}

class CampaignConfigurationManager: CampaignConfigurationManagerProtocol {
    @Published var selectedTargetIDs: Set<String> = []
    @Published var selectedCampaigns: [String: MonthlyFee] = [:]
}
