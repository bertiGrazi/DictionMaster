//
//  PurchaseView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 06/02/24.
//

import SwiftUI

struct PurchaseView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .top) {
                    VStack(spacing: 14) {
                        Image("purchase")
                            .resizable()
                            .scaledToFit()
                            .fixedSize(horizontal: false, vertical: true)
                        
                        ZStack {
                            VStack(spacing: 2) {
                                Image("icon")
                                    .frame(width: 78, height: 78)
                                
                                
                                Image("title")
                                    .padding(.leading)
                            }
                        }
                        .offset(y: -48)
                        
                        VStack(spacing: 12) {
                            MultiColorText(components: [
                                MultiColorText.TextComponent(text: "Subscribe now to get ", color: Color.theme.textPrimaryColor, isBold: true),
                                MultiColorText.TextComponent(text: " unlimited ", color: Color.theme.buttonColor, isBold: true),
                                MultiColorText.TextComponent(text: " searches full access to", color: Color.theme.textPrimaryColor, isBold: true),
                                MultiColorText.TextComponent(text: " all features.  ", color: Color.theme.buttonColor, isBold: true),
                            ])
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                            .padding(.top, -40)
                            
                            Spacer()
                            
                            MultiColorText(components: [
                                MultiColorText.TextComponent(text: "Try 7 Days Free, ", color: Color.theme.textPrimaryColor, isBold: true),
                                MultiColorText.TextComponent(text: " then only ", color: Color.theme.textPrimaryColor, isBold: false),
                                MultiColorText.TextComponent(text: " $19,99", color: Color.theme.textPrimaryColor, isBold: true),
                                MultiColorText.TextComponent(text: " per year.\nCancel anytime.  ", color: Color.theme.textPrimaryColor, isBold: false),
                            ])
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        }
                        
                        
                        PrimaryButton(buttonText: "SUBSCRIBE") {
                            print("clicou aqui")
                        }
                        .padding(.horizontal, 20)
                    }
                    .frame(width: geometry.size.width)
                }
            }
            .frame(width: geometry.size.width)
            .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    PurchaseView()
}

//Try 7 Days Free, then only $19,99 per year. Cancel anytime.
