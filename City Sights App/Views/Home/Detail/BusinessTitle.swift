//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Warkois on 5/14/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            //Business Name
            Text(business.name!)
                .font(.largeTitle)
         
        
            // Loop through address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                        
                }
            }
            
            //Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

