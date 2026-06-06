//
//  TargetingSelectionView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 02.06.26.
//

import SwiftUI
import INGCampaignModels

struct TargetingSelectionView<ViewModel: TargetingSelectionViewModelling>: View {
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            Section {
                Text("Choose your targeting")
                Text("Select one or more targeting options.")
            }
            
            ForEach(viewModel.targetingCategories) { item in
                Text(item.target)
                    .onTapGesture(perform: {
                        print("\(item.target)")
                        viewModel.onTapCategory(item)
                    })
            }
            
            Section {
                Button("Continue") {
                    viewModel.onTapContinue()
                }
            }
            
        }
        .task {
            await viewModel.loadTargetingCategories()
        }
    }
}

#Preview {
    //TargetingSelectionView()
}
