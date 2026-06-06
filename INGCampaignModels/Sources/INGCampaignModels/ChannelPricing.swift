//
//  ChannelPricing.swift
//  INGCampaignModels
//
//  Created by Cristian Petra on 05.06.26.
//

public struct ChannelPricing: Codable {
    public let channel: String
    public let monthlyFees: [MonthlyFee]

    enum CodingKeys: String, CodingKey {
        case channel
        case monthlyFees = "monthly_fees"
    }
}

public struct MonthlyFee: Codable, Equatable, Hashable {
    public let price: Double
    public let details: [String]
    public let currency: String
}

extension MonthlyFee {
    func getFormattedDetails() -> String {
       return ""
    }
}
