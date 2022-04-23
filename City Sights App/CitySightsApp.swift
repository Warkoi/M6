//
//  City_Sights_AppApp.swift
//  City Sights App
//
//  Created by Warkois on 4/12/22.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
