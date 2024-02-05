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

        init(text: String, color: Color) {
            self.id = UUID()
            self.text = text
            self.color = color
        }
    }

    var body: some View {
        components.reduce(Text("")) { result, component in
            result + Text(component.text)
                .foregroundColor(component.color)
        }
    }
}



#Preview {
    MultiColorText(components: [
        MultiColorText.TextComponent(text: "Subscribe now to get ", color: Color.theme.textPrimaryColor),
        MultiColorText.TextComponent(text: " unlimited ", color: Color.theme.buttonColor),
        MultiColorText.TextComponent(text: " searches full access to", color: Color.theme.textPrimaryColor),
        MultiColorText.TextComponent(text: " all features.  ", color: Color.theme.buttonColor),
    ])
}
