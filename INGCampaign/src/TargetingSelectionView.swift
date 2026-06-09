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
        VStack(spacing: 10) {
            
            Spacer()
                .frame(height: 20)
            
            Text("Choose your targeting")
            Text("Select one or more targeting options.")
            
            List {
                
                ForEach(viewModel.targetingCategories) { item in
                    Text(item.target)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            print("\(item.target)")
                            viewModel.onTapCategory(item)
                        })
                        .listRowBackground(
                            viewModel.selectedCategories.contains(where: { $0.id == item.id })
                                    ? Color.blue
                                    : Color.white
                            )

                }
                
            }
        
            Button("Continue") {
                viewModel.onTapContinue()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal)
            .disabled(viewModel.selectedCategories.isEmpty)
        }
        .task {
            await viewModel.loadTargetingCategories()
        }
    }
}

#Preview {
    //TargetingSelectionView()
}
