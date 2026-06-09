//
//  ChannelListView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 04.06.26.
//

import SwiftUI
import INGCampaignModels

struct ChannelListView<ViewModel: ChannelListViewModelling>: View {
    
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Avaialble channel list view")
            
            List(viewModel.campaignChannels) { channel in
                Text(channel.channel)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.onTapChannel(channel: channel)
                    }
            }
            
            Button("Review selections") {
                viewModel.onTapReviewSelection()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .overlay {
             if viewModel.isLoading {
                 ProgressView()
             }
         }
    }
    
}

#Preview {
    //ChannelListView()
}
