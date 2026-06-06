//
//  CampaignSelectionItemView.swift
//  INGCampaign
//
//  Created by Cristian Petra on 06.06.26.
//

import SwiftUI
import INGCampaignModels

struct CampaignSelectionItemView: View {
    var monthlyFee: MonthlyFee
    
    @State var isChecked: Bool = false
    
    var body: some View {
        HStack {
            CheckboxView(isChecked: ($isChecked))
            
            VStack {
                ForEach(monthlyFee.details, id: \.self) { detail in
                    Text(detail)
                }
            }
            
            Spacer()
            
            Text(
                monthlyFee.price,
                format: .currency(code: monthlyFee.currency)
            )
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    //CampaignSelectionItemView()
}


struct CheckboxView: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            HStack {
                Image(systemName: isChecked
                      ? "checkmark.square.fill"
                      : "square")
                    .font(.title2)
            }
        }
        .buttonStyle(.plain)
    }
}
