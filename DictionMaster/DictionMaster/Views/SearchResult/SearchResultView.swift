//
//  SearchResultView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 06/02/24.
//

import SwiftUI
import AVFoundation

struct SearchResultView: View {
    let searchText: String
    @State private var player: AVPlayer?
    
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
                        Button(action: playAudio) {
                            Image("audioSpeaker")
                                .frame(width: 52, height: 52)
                                .background(Color.theme.buttonColor)
                                .clipShape(Circle())
                        }
                        
                        ForEach(viewModel.phonetics, id: \.self) { phonetic in
                            if let firstPhonetics = viewModel.phonetics.first(where: { $0.text != nil }) {
                                Text(firstPhonetics.text ?? "")
                                    .foregroundStyle(Color.theme.textSecondaryColor)
                                    .bold()
                                    .font(.custom("", size: 25))
                            }
                        }

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
                    
                    NavigationLink(destination: {
                        if viewModel.remainingSearches >= 5 {
                            SearchView()
                        } else {
                            PurchaseView()
                        }
                    }) {
                        Text("SEARCH")
                            .font(.headline)
                            .kerning(1.8)
                            .padding()
                            .foregroundColor(Color.theme.whiteColor)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color.theme.buttonColor))
                            .padding()
                    }
                    .navigationBarBackButtonHidden()
                }
                .padding(.leading, 20)
            }
        }
        .onAppear {
            viewModel.fetchMeanings(for: searchText)
            viewModel.getWordPhonetics(for: searchText)
        }
    }
    
    func playAudio() {
        if let firstPhoneticWithAudio = viewModel.phonetics.first(where: { $0.audio != nil }) {
            guard let url = URL(string: firstPhoneticWithAudio.audio ?? "") else {
                return
            }
            
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            player?.play()
        }
    }

}
#Preview {
    SearchResultView(searchText: "love")
}


