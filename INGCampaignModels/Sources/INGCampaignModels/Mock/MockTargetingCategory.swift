//
//  MockTargetingCategory.swift
//  INGCampaignModels
//
//  Created by Cristian Petra on 02.06.26.
//

public struct MockTargetingCategory {
    public init() { }
    
    public let targets: [TargetingCategory] = [
        TargetingCategory(target: "Location", availableChannels: MockCampaignChannel.channels),
        TargetingCategory(target: "Age", availableChannels: MockCampaignChannel.channels),
    ]
    
}

public struct MockCampaignChannel {
    public init() { }
    public static let channels: [CampaignChannel] = [
        CampaignChannel(channel: "Facebook", channelId: "12345"),
        CampaignChannel(channel: "Linkedin", channelId: "12346"),
        CampaignChannel(channel: "Instagram", channelId: "12347"),
    ]
}
