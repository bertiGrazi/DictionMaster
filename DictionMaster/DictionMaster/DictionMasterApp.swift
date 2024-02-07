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
                }
            }
        }
    }
}
