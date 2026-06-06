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
                
                if let channelPricing: ChannelPricing = viewModel.channelPricing {
                    ForEach(channelPricing.monthlyFees.indices, id: \.self) { idx in
                        CampaignSelectionItemView(monthlyFee: channelPricing.monthlyFees[idx])
                            .background(
                                idx % 2 == 0 ? Color.blue.opacity(0.1) :  Color.green.opacity(0.1)
                            )
                    }
                }
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
