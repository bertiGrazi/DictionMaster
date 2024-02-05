//
//  CustomFlagView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct CustomFlagView: View {
    var countryNameText: String
    var countryImageName: String
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(countryImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                
                Text(countryNameText.uppercased())
                    .font(.caption)
                    .kerning(1.2)
                    .foregroundColor(Color.theme.textPrimaryColor)
            }
        }
        .frame(minWidth: 137, minHeight: 40)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.theme.grayColor))
        
    }
}

#Preview {
    CustomFlagView(countryNameText: "English", countryImageName: "spain")
        .padding(20)
}
