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
    
    func onTapSendEmail() async throws
}

class CampaignReviewSelectionViewModel: CampaignReviewSelectionViewModelling {
    
    private var campaignManager: CampaignConfigurationManagerProtocol
    
    public init(campaignManager: CampaignConfigurationManagerProtocol) {
        self.campaignManager = campaignManager
    }
    
    var campaignRows: [CampaignPricingRow] {
       // Array(campaignManager.selectedCampaigns.values)
        
        let rows = campaignManager.selectedCampaigns.values.map { fee in
            CampaignPricingRow(monthlyFee: fee, isChecked: false)
        }
        return rows
    }
    
    func onTapSendEmail() async throws {
        
    }
}
