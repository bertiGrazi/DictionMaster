//
//  ContentView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct SearchView: View {
    @State private var text: String = ""
    
    @StateObject var viewModel = DictionaryMeaningsViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center) {
                CustomFlagView(countryNameText: "english", countryImageName: "english")
                    .padding(.top, 32)
                
                Spacer()
                
                TextField("", text: $text)
                    .padding()
                    .font(.custom("SF Pro Rounded", size: 38))
                    .foregroundColor(Color.theme.textPrimaryColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                
                if text.isEmpty {
                    TextField("Enter your text", text: $text)
                        .padding()
                        .font(.custom("SF Pro Rounded", size: 38))
                        .foregroundColor(Color.theme.grayColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                }
                    
                List(viewModel.meanings, id: \.self) { meaning in
                    Text(meaning.partOfSpeech ?? "Teste")
                        .bold()
                        .foregroundStyle(Color.red)
                }
                
                Spacer()
                
                PrimaryButton(buttonText: "search") {
                    print("clicou aqui")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
            .onAppear {
                viewModel.fetchMeanings()
            }
        }
    }
}

#Preview {
    SearchView()
}
