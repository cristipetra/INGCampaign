//
//  CampaignReviewView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 08.06.26.
//

import SwiftUI

struct CampaignReviewSelectionView<ViewModel: CampaignReviewSelectionViewModelling>: View {
    
    @StateObject var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                Text("Selected campaigns")
                
                ForEach(viewModel.campaignRows) { row in
                    CampaignSelectionItemView(
                        monthlyFee: row.monthlyFee,
                        isChecked: true
                    )
                    
                }
                
                Button("Send email") {
                    Task {
                        try await viewModel.onTapSendEmail()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
        
    }
}

#Preview {
    //CampaignReviewSelectionView()
}
