//
//  DefinitionView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI


struct DefinitionView: View {
    var definitions: [Definition]
    
    struct Definition {
        var text: String
        var example: String?
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(definitions.indices, id: \.self) { index in
                Text("\(index+1)) \(definitions[index].text)")
                    .font(.title3)
                    .foregroundColor(Color.theme.textPrimaryColor)
                    .bold()
                
                if let example = definitions[index].example {
                    if example.isEmpty {
                        Text("")
                    } else {
                        Text("• \(example)")
                            .font(.body)
                            .foregroundColor(Color.theme.textPrimaryColor)
                    }
                }
            }
        }
    }
}

#Preview {
    DefinitionView(definitions: [
        DefinitionView.Definition(text: "Furniture with a top surface to accommodate a variety of uses.", example: "I bought a new table for the dining room."),
         DefinitionView.Definition(text: "A two-dimensional presentation of data.", example: ""),
         DefinitionView.Definition(text: "The top of a stringed instrument, particularly a member of the violin family.", example: "The violinist carefully tuned the strings at the table of the instrument.")
    ])
    .padding(12)
}
