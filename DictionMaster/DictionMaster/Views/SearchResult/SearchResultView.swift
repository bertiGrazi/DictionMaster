//
//  SearchResultView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 06/02/24.
//

import SwiftUI

struct SearchResultView: View {
    let searchText: String
    
    @StateObject var viewModel = DictionaryMeaningsViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    Text("\(searchText)")
                        .foregroundStyle(Color.theme.textPrimaryColor)
                        .font(.custom("", size: 45))
                        .bold()
                        .padding(.top, 16)
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            print("clicou play")
                        }) {
                            Image("audioSpeaker")
                                .frame(width: 52, height: 52)
                                .background(Color.theme.buttonColor)
                                .clipShape(Circle())
                        }
                        
                        Text("/ˌedʒuˈkeɪʃn/")
                            .foregroundStyle(Color.theme.textSecondaryColor)
                            .bold()
                            .font(.custom("", size: 25))
                    }
                    
                    ForEach(viewModel.meanings, id: \.self) { meaning in
                        ForEach(meaning.definitions, id: \.self) { definition in
                            DefinitionView(definitions: [
                                DefinitionView.Definition(text: definition.definition ?? "", example: definition.example)
                            ])
                        }
                    }

                    Divider()
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text("That’s it for “\(searchText)”!")
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
        .onAppear {
            viewModel.fetchMeanings(for: searchText)
        }
    }
}
#Preview {
    SearchResultView(searchText: "love")
}


