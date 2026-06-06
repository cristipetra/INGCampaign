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
        VStack {
            Text("Avaialble channel list view")
            
            List(viewModel.campaignChannels) { channel in
                Text(channel.channel)
                    .onTapGesture {
                        viewModel.onTapChannel(channel: channel)
                    }
            }
            
            Text("Based on your targeting selection:")
        }
        
        .task {
            //await viewModel.loadChannelsDetails()
        }
    }
}

#Preview {
    //ChannelListView()
}
