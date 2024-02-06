//
//  ContentView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct SearchView: View {
    @State private var text: String = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center) {
                CustomFlagView(countryNameText: "english", countryImageName: "english")
                    .padding(.top, 32)
                
                Spacer()
                
                TextField("Enter your text", text: $text)
                    .padding()
                    .font(.custom("SF Pro Rounded", size: 38))
                    .foregroundColor(Color.theme.grayColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    
                
                Spacer()
                
                PrimaryButton(buttonText: "search") {
                    print("clicou aqui")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
            
        }
    }
}

#Preview {
    SearchView()
}
