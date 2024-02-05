//
//  LaunchScreenView.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var textName: [String] = "by Grazielli Lima Berti".map { String($0) }
    @State private var showNameText: Bool = false
    private let timerToShow = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    
    @Binding var showLaunchScreen: Bool
    
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
                    if showNameText {
                        HStack(spacing: 0) {
                            ForEach(textName.indices) { index in
                                Text(textName[index])
                                    .font(.subheadline)
                                    .foregroundStyle(Color.theme.textPrimaryColor)
                                    .offset(y: counter == index ? -5 : 0)
                                
                            }
                        }
                        .transition(AnyTransition.scale.animation(.easeIn))
                    }
                }
                .offset(y: geometry.size.height * 0.4)
            }
            .onAppear {
                showNameText.toggle()
            }
            .onReceive(timerToShow, perform: { _ in
                withAnimation(.spring()) {
                    let lastIndex = textName.count - 1
                    if counter == lastIndex {
                        counter = 0
                        loops += 1
                        
                        if loops >= 2 {
                            showLaunchScreen = false
                        }
                    } else {
                        counter += 1
                    }
                }
            })
            .onDisappear {
                print("LaunchScreenView disappeared")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView(showLaunchScreen: .constant(true))
    }
}

