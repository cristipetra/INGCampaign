//
//  Target.swift
//  INGCampaignModels
//
//  Created by Cristian Petra on 02.06.26.
//

import Foundation

public struct TargetingCategory: Codable, Identifiable {
    public var id: String { target }
    public let target: String
    public let availableChannels: [CampaignChannel]
    
    enum CodingKeys: String, CodingKey {
        case target
        case availableChannels = "available_channels"
    }
}
