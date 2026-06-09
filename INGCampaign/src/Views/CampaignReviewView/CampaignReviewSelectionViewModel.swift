//
//  CampaignReviewSelectionViewModel.swift
//  INGCampaign
//
//  Created by Cristian Petra on 08.06.26.
//

import Foundation
internal import Combine
import INGCampaignModels

protocol CampaignReviewSelectionViewModelling: ObservableObject {
    var campaignRows: [CampaignPricingRow] { get }
    var bodyEmail: String { get }
    
    func onTapSendEmail()
}

class CampaignReviewSelectionViewModel: CampaignReviewSelectionViewModelling {
    
    private var campaignManager: CampaignConfigurationManagerProtocol
    
    public init(campaignManager: CampaignConfigurationManagerProtocol) {
        self.campaignManager = campaignManager
    }
    
    var campaignRows: [CampaignPricingRow] {
        let rows = campaignManager.selectedCampaigns.values.map { fee in
            CampaignPricingRow(monthlyFee: fee, isChecked: false)
        }
        return rows
    }
    
    var bodyEmail: String {
        var lines: [String] = []

        lines.append("Hello,")
        lines.append("")
        lines.append("Please find below the details of the selected campaign.")
        lines.append("")
        
        lines.append("Selected channels:")
        for (channel, fee) in campaignManager.selectedCampaigns {
            let price = fee.price.formatted(.currency(code: fee.currency))
            lines.append("  \(channel) — \(price)/month")
            for detail in fee.details {
                lines.append("      - \(detail)")
            }
        }
        lines.append("")
        lines.append("Kind regards")

        return lines.joined(separator: "\n")
            
    }
    
    func onTapSendEmail() {
        EmailComposer.compose(
            to: "bogus@bogus.com",
            subject: "Selected Campaigns",
            body: bodyEmail
        )
    }
}
