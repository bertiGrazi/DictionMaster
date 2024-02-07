//
//  DictionMasterApp.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import SwiftUI

@main
struct DictionMasterApp: App {
    @State private var showLaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                   SearchView()
                    //SearchResultView()
                    
                    if showLaunchScreen {
                        LaunchScreenView(showLaunchScreen: $showLaunchScreen)
                            .transition(.move(edge: .leading))
                            .zIndex(2.0)
                            .onDisappear {
                                print("ContentView disappeared")
                            }
                    }
                    
                }
            }
        }
    }
}
