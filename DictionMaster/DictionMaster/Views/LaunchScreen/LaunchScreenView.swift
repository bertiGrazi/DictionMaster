//
//  LaunchScreenView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var textName = "by Grazielli Lima Berti"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.theme.whiteColor
                
                VStack {
                    Image("icon")
                        .frame(width: 78, height: 78)
                    
                    Image("title")
                        .padding(.leading)
                }
                
                ZStack {
                    Text(textName)
                        .font(.subheadline)
                        .foregroundStyle(Color.theme.textPrimaryColor)
                }
                .offset(y: geometry.size.height * 0.4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

