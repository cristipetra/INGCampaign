//
//  ChannelCampaign.swift
//  INGCampaignModels
//
//  Created by Cristian Petra on 02.06.26.
//
import Foundation

public struct CampaignChannel: Codable, Identifiable, Sendable, Equatable, Hashable {
    public var id: String { channelId }
    public let channel: String
    public let channelId: String
    
    enum CodingKeys: String, CodingKey {
        case channel
        case channelId = "channel_id"
    }
}
