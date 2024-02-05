//
//  DualColorTextView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct MultiColorText: View {
    var components: [TextComponent]

    struct TextComponent: Identifiable {
        var id: UUID
        var text: String
        var color: Color
        var isBold: Bool

        init(text: String, color: Color, isBold: Bool = false) {
            self.id = UUID()
            self.text = text
            self.color = color
            self.isBold = isBold
        }
    }

    var body: some View {
        components.reduce(Text("")) { result, component in
            result + Text(component.text)
                .foregroundColor(component.color)
                .bold(component.isBold)
        }
    }
}

#Preview {
    MultiColorText(components: [
        MultiColorText.TextComponent(text: "Subscribe now to get ", color: Color.theme.textPrimaryColor, isBold: true),
        MultiColorText.TextComponent(text: " unlimited ", color: Color.theme.buttonColor, isBold: true),
        MultiColorText.TextComponent(text: " searches full access to", color: Color.theme.textPrimaryColor, isBold: true),
        MultiColorText.TextComponent(text: " all features.  ", color: Color.theme.buttonColor, isBold: true),
    ])
    .font(.title3)
}
