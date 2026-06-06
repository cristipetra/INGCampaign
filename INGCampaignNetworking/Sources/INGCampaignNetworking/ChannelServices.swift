//
//  ChannelServices.swift
//  INGCampaignNetworking
//
//  Created by Cristian Petra on 04.06.26.
//
import Foundation
import INGCampaignModels

public protocol ChannelServicesProtocol {
    func getChanellDetails(channelId: String) async throws -> ChannelPricing
}

public class ChannelServices: ChannelServicesProtocol {
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func getChanellDetails(channelId: String) async throws -> ChannelPricing {
        //return MockCampaignChannel.channels[0]
        
        
        let channelDetails: ChannelPricing = try await apiClient.send(endpoint: .getCampaign(id: channelId))
        print(channelDetails)
        return channelDetails
    }
    
}
