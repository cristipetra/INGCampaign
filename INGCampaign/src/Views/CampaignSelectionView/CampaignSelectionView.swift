//
//  CampaignSelectionView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 05.06.26.
//

import SwiftUI
import INGCampaignModels

struct CampaignSelectionView<ViewModel: CampaignSelectionViewModelling>: View {
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("select")
                
                Text(viewModel.channel.channel)
                
                ForEach(viewModel.pricingRows) { row in
                    CampaignSelectionItemView(
                        monthlyFee: row.monthlyFee,
                        isChecked: row.isChecked
                    )
                    .background(Color.gray.opacity(0.1))
                    .onTapGesture {
                        viewModel.onSelectedCampaignPricing(
                            monthlyFee: row.monthlyFee
                        )
                    }
                }
                
                Button("Reset") {
                    viewModel.onResetSelection()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }
        }
        .task {
            await viewModel.loadChannelsDetails()
        }
    }
    
}

#Preview {
    //CampaignSelectionView()
}
