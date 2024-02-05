//
//  PrimaryButton.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct PrimaryButton: View {
    var buttonText: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonText.uppercased())
                .font(.headline)
                .kerning(1.8)
                .padding()
                .foregroundColor(Color.theme.whiteColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.theme.buttonColor))
    }
}

#Preview {
    PrimaryButton(buttonText: "Search", action: {})
        .padding(20)
        .previewLayout(.sizeThatFits)
}
