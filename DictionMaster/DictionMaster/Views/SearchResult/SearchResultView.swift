//
//  SearchResultView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 06/02/24.
//

import SwiftUI

struct SearchResultView: View {
    var body: some View {
        ZStack {
            ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        
                            Text("Education")
                                .foregroundStyle(Color.theme.textPrimaryColor)
                                .font(.custom("", size: 45))
                                .bold()
                                .padding(.top, 16)
                            
                            Text("/ˌedʒuˈkeɪʃn/")
                                .foregroundStyle(Color.theme.textSecondaryColor)
                                .bold()
                                .font(.custom("", size: 25))
                            
                            DefinitionView(definitions: [
                                DefinitionView.Definition(text: "Furniture with a top surface to accommodate a variety of uses.", example: "I bought a new table for the dining room."),
                                 DefinitionView.Definition(text: "A two-dimensional presentation of data.", example: ""),
                                 DefinitionView.Definition(text: "The top of a stringed instrument, particularly a member of the violin family.", example: "The violinist carefully tuned the strings at the table of the instrument.")
                            ])

                            Divider()
                            
                            VStack(alignment: .leading, spacing: 14) {
                                Text("That’s it for “education”!")
                                    .foregroundStyle(Color.theme.textPrimaryColor)
                                    .font(.custom("", size: 24))
                                    .fontWeight(.black)
                                    
                                
                                Text("Try another search now!")
                                    .foregroundStyle(Color.theme.textPrimaryColor)
                                    .font(.custom("", size: 16))
                            }
                        
                        PrimaryButton(buttonText: "new search") {
                            print("botão new search")
                            }
                        .padding(.trailing, 20)
                        }
                    .padding(.leading, 20)
            }
        }
    }
}


#Preview {
    SearchResultView()
}


