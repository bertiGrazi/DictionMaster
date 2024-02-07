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
        NavigationView {
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
                        
                    Spacer()
                    
                    NavigationLink(destination: SearchResultView(searchText: text)) {
                        Text("SEARCH")
                            .font(.headline)
                            .kerning(1.8)
                            .padding()
                            .foregroundColor(Color.theme.whiteColor)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color.theme.buttonColor))
                            .padding()
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
