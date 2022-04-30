//
//  ContentView.swift
//  City Sights App
//
//  Created by Warkois on 4/12/22.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the authorization status of gelocating the user
        if model.authorizationState == .notDetermined {
            
        }
        
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways{
            // If approved show home view
            HomeView()
            
        }
        // If denied show denied view
        else {
            
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
          
    }
}
